// .env 파일을 읽어 환경변수를 process.env에 넣기 위한 라이브러리
import dotenv from "dotenv";

// 파일/폴더 경로를 안전하게 다루기 위한 Node 내장 모듈
import path from "path";

// ES Module 환경에서 현재 파일 경로를 얻기 위한 함수
import { fileURLToPath } from "url";

// Google Sheets API를 사용하기 위한 공식 라이브러리
import { google } from "googleapis";

// 입력값 검증(schema validation) 라이브러리
import { z } from "zod";

// MCP 서버 객체 생성용 클래스
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";

// Cursor와 stdio 방식으로 통신하기 위한 transport
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

// import.meta.url -> 실제 파일 경로 문자열로 변환
const __filename = fileURLToPath(import.meta.url);

// 현재 파일이 들어있는 폴더 경로 구하기
const __dirname = path.dirname(__filename);

// 현재 파일 기준으로 .env 파일을 읽기
dotenv.config({
  path: path.join(__dirname, ".env"),
});

// Google Sheets API 접근 권한 범위
const SCOPES = ["https://www.googleapis.com/auth/spreadsheets"];

// .env에 적어둔 기본 스프레드시트 ID
const DEFAULT_SPREADSHEET_ID = process.env.GOOGLE_SHEETS_DEFAULT_SPREADSHEET_ID;

// 서비스 계정 키 경로가 없으면 서버 실행 중단
if (!process.env.GOOGLE_APPLICATION_CREDENTIALS) {
  throw new Error("GOOGLE_APPLICATION_CREDENTIALS is not set.");
}

// credentials.json 상대경로를 절대경로로 변환
const credentialsPath = path.resolve(
  __dirname,
  process.env.GOOGLE_APPLICATION_CREDENTIALS,
);

// Google API 인증 객체 생성
const auth = new google.auth.GoogleAuth({
  keyFile: credentialsPath,
  scopes: SCOPES,
});

// Google Sheets API 클라이언트 생성
const sheets = google.sheets({ version: "v4", auth });

// spreadsheetId가 들어오면 그걸 쓰고, 없으면 기본값 사용
function ensureSpreadsheetId(spreadsheetId) {
  const id = spreadsheetId || DEFAULT_SPREADSHEET_ID;

  // 둘 다 없으면 어떤 시트를 쓸지 모르므로 에러
  if (!id) {
    throw new Error(
      "spreadsheetId is required or set GOOGLE_SHEETS_DEFAULT_SPREADSHEET_ID.",
    );
  }
  return id;
}

// MCP tool 결과를 Cursor가 읽을 수 있는 텍스트 형식으로 바꾸는 함수
function textResult(obj) {
  return {
    content: [
      {
        type: "text",
        text: typeof obj === "string" ? obj : JSON.stringify(obj, null, 2),
      },
    ],
  };
}

// MCP 서버 생성
const server = new McpServer({
  name: "google-sheets-mcp",
  version: "1.0.0",
});

// -----------------------------
// 1) 범위 읽기 도구
// -----------------------------
server.registerTool(
  "gsheets_read_range",
  {
    title: "Read a range from Google Sheets",
    description: "Reads values from a Google Sheet range in A1 notation.",
    inputSchema: {
      spreadsheetId: z.string().optional(), // 선택: 시트 ID
      range: z.string(), // 필수: 예) Sheet1!A1:C10
    },
  },
  async ({ spreadsheetId, range }) => {
    try {
      const id = ensureSpreadsheetId(spreadsheetId);

      // 특정 범위 값 읽기
      const res = await sheets.spreadsheets.values.get({
        spreadsheetId: id,
        range,
      });

      return textResult({
        spreadsheetId: id,
        range,
        values: res.data.values || [],
      });
    } catch (error) {
      return textResult({
        error: error instanceof Error ? error.message : String(error),
      });
    }
  },
);

// -----------------------------
// 2) 행 추가 도구
// -----------------------------
server.registerTool(
  "gsheets_append_rows",
  {
    title: "Append rows to Google Sheets",
    description: "Appends one or more rows to the end of a sheet range.",
    inputSchema: {
      spreadsheetId: z.string().optional(),
      range: z.string(),
      values: z.array(z.array(z.union([z.string(), z.number(), z.boolean()]))),
    },
  },
  async ({ spreadsheetId, range, values }) => {
    try {
      const id = ensureSpreadsheetId(spreadsheetId);

      // 시트 아래쪽에 새 행 추가
      const res = await sheets.spreadsheets.values.append({
        spreadsheetId: id,
        range,
        valueInputOption: "USER_ENTERED",
        insertDataOption: "INSERT_ROWS",
        requestBody: { values },
      });

      return textResult({
        spreadsheetId: id,
        range,
        updates: res.data.updates,
      });
    } catch (error) {
      return textResult({
        error: error instanceof Error ? error.message : String(error),
      });
    }
  },
);

// -----------------------------
// 3) 범위 덮어쓰기 도구
// -----------------------------
server.registerTool(
  "gsheets_update_range",
  {
    title: "Update a range in Google Sheets",
    description: "Overwrites a specific range with the provided values.",
    inputSchema: {
      spreadsheetId: z.string().optional(),
      range: z.string(),
      values: z.array(z.array(z.union([z.string(), z.number(), z.boolean()]))),
    },
  },
  async ({ spreadsheetId, range, values }) => {
    try {
      const id = ensureSpreadsheetId(spreadsheetId);

      // 지정한 범위를 새 값으로 덮어쓰기
      const res = await sheets.spreadsheets.values.update({
        spreadsheetId: id,
        range,
        valueInputOption: "USER_ENTERED",
        requestBody: { values },
      });

      return textResult({
        spreadsheetId: id,
        range,
        updatedRows: res.data.updatedRows,
        updatedColumns: res.data.updatedColumns,
        updatedCells: res.data.updatedCells,
      });
    } catch (error) {
      return textResult({
        error: error instanceof Error ? error.message : String(error),
      });
    }
  },
);

// -----------------------------
// 4) 범위 비우기 도구
// -----------------------------
server.registerTool(
  "gsheets_clear_range",
  {
    title: "Clear a range in Google Sheets",
    description: "Clears values from a Google Sheet range.",
    inputSchema: {
      spreadsheetId: z.string().optional(),
      range: z.string(),
    },
  },
  async ({ spreadsheetId, range }) => {
    try {
      const id = ensureSpreadsheetId(spreadsheetId);

      // 지정한 범위의 셀 값을 제거
      const res = await sheets.spreadsheets.values.clear({
        spreadsheetId: id,
        range,
        requestBody: {},
      });

      return textResult({
        spreadsheetId: id,
        clearedRange: res.data.clearedRange,
      });
    } catch (error) {
      return textResult({
        error: error instanceof Error ? error.message : String(error),
      });
    }
  },
);

// -----------------------------
// 5) 키워드 요약 쓰기 도구
// -----------------------------
server.registerTool(
  "gsheets_write_keyword_summary",
  {
    title: "Write keyword summary rows",
    description:
      "Writes keyword summary rows with columns like keyword, count, source, date.",
    inputSchema: {
      spreadsheetId: z.string().optional(),
      sheetName: z.string().default("KeywordSummary"),
      rows: z.array(
        z.object({
          keyword: z.string(),
          count: z.number(),
          source: z.string().default("slack"),
          date: z.string(),
        }),
      ),
    },
  },
  async ({ spreadsheetId, sheetName, rows }) => {
    try {
      const id = ensureSpreadsheetId(spreadsheetId);

      // 객체 배열을 시트용 2차원 배열로 변환
      const values = rows.map((row) => [
        row.keyword,
        row.count,
        row.source,
        row.date,
      ]);

      // A~D열에 쓰기
      const range = `${sheetName}!A:D`;

      const res = await sheets.spreadsheets.values.append({
        spreadsheetId: id,
        range,
        valueInputOption: "USER_ENTERED",
        insertDataOption: "INSERT_ROWS",
        requestBody: { values },
      });

      return textResult({
        spreadsheetId: id,
        sheetName,
        appended: rows.length,
        updates: res.data.updates,
      });
    } catch (error) {
      return textResult({
        error: error instanceof Error ? error.message : String(error),
      });
    }
  },
);

// Cursor와 stdio로 통신할 transport 생성
const transport = new StdioServerTransport();

// MCP 서버 연결 시작
await server.connect(transport);