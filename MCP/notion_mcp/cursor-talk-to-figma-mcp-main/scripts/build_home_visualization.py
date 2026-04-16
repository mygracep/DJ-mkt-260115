# -*- coding: utf-8 -*-
"""Generate home-page-visualization.html with guaranteed UTF-8 Korean copy."""
from pathlib import Path

KO = {
    "title": "MCP Prototype \u2014 Home \uc2dc\uac01\ud654",
    "meta1": "\uc5f0\uacb0\ub41c Figma \ubb38\uc11c\ub294 \ube44\uc5b4 \uc788\uc5b4 Notion MCP Prototype(IA\xb7\uc694\uad6c\uc0ac\ud56d)\uc744 \ubc18\uc601\ud588\uc2b5\ub2c8\ub2e4.",
    "talk": "TalkToFigma \ucc44\ub110",
    "nav_label": "\uc8fc\uc694 \uba54\ub274",
    "nav_brand": "\ube0c\ub79c\ub4dc",
    "nav_look": "\ub8e9\ubd81",
    "nav_best": "\ubca0\uc2a4\ud2b8",
    "nav_event": "\uc774\ubca4\ud2b8",
    "cta_event": "\uc774\ubca4\ud2b8 \ucc38\uc5ec",
    "h1": "\uc77c\uc0c1\uc758 \uc2e4\ub8e8\uc5d7\uc5d0, \uc870\uc6a9\ud55c \uc124\ub80c\uc744 \ub354\ud558\ub2e4",
    "lead": (
        "\uac10\uc131 \uae30\ubc18 \ud328\uc158 \ube0c\ub79c\ub4dc \ub79c\ub529. "
        "\uc218\ub3c4\uad8c \uc9c1\uc7a5\uc778 \uc5ec\uc131\uc744 \uc704\ud55c \uccab\uc778\uc0c1\uacfc \uc2a4\ud0c0\uc77c\ub9c1 \uc778\uc0ac\uc774\ud2b8."
    ),
    "req_note": "\uc694\uad6c\uc0ac\ud56d: Hero, \uc2ac\ub85c\uac74, \uc9e7\uc740 CTA, \uacfc\ub3c4\ud55c \ud14d\uc2a4\ud2b8 \uc9c0\uc591",
    "btn_shop": "\uc9c0\uae08 \ub458\ub7ec\ubcf4\uae30",
    "btn_look": "\ub8e9\ubd81 \ubcf4\uae30",
    "hero_aria": "Hero \uc774\ubbf8\uc9c0 \ud50c\ub808\uc774\uc2a4\ud640\ub354",
    "brand_h": "\ube0c\ub79c\ub4dc \uc18c\uac1c",
    "brand_ia": "IA: \ube0c\ub79c\ub4dc\uc18c\uac1c",
    "brand_p1": (
        "\uc2e0\uaddc \ubc29\ubb38\uc790\uac00 \ube0c\ub79c\ub4dc\ub97c \ube60\ub974\uac8c \uc774\ud574\ud558\ub3c4\ub85d "
        "\uce74\ud53c\uc640 \uc5ec\ubc31\uc774 \uc911\uc2ec\uc778 \ub808\uc774\uc544\uc6c3\uc73c\ub85c \uad6c\uc131\ud569\ub2c8\ub2e4."
    ),
    "brand_p2": (
        "\ubaa9\ud45c: \ube0c\ub79c\ub4dc \uccab\uc778\uc0c1, \uc774\ubca4\ud2b8 \ucc38\uc5ec \uc804\ud658, \ubaa8\ubc14\uc77c \uc911\uc2ec \uacbd\ud5d8 (Product Brief)."
    ),
    "brand_btn": "\uc774\ubca4\ud2b8\ub85c \uc774\ub3d9",
    "look_h": "\ucd94\ucc9c \ub8e9\ubd81",
    "look_ia": "IA: \ucd94\ucc9c\ub8e9\ubd81",
    "best_h": "\ubca0\uc2a4\ud2b8 \uc0c1\ud488",
    "best_sub": "\uce74\ub4dc 3~6\uac1c \ub178\ucd9c (Requirements)",
    "ev_h": "\uc774\ubca4\ud2b8",
    "ev_ia": "IA: \uc774\ubca4\ud2b8\ubc30\ub108",
    "ev_t": "\uc2a4\ud504\ub9c1 \uc624\ud508 \u2014 \uccab \uad6c\ub9e4 15%",
    "ev_p": (
        "\uc9e7\uace0 \ud589\ub3d9 \uc720\ub3c4\ud615 \uce74\ud53c\uc640 \uba85\ud655\ud55c \uae30\ud55c\uc73c\ub85c \uc804\ud658\uc744 \uc720\ub3c4\ud569\ub2c8\ub2e4."
    ),
    "ev_btn": "\ucc38\uc5ec\ud558\uae30",
    "faq_h": "\uc790\uc8fc \ubb3b\ub294 \uc9c8\ubb38",
    "faq_sub": "\uc544\ucf54\ub514\uc5b8 (Requirements)",
    "faq1q": "\ubc30\uc1a1\uc740 \uc5bc\ub9c8\ub098 \uac78\ub9ac\ub098\uc694?",
    "faq1a": "\uc601\uc5c5\uc77c \uae30\uc900 2~4\uc77c \ub0b4 \ucd9c\uace0\uc774\uba70, \uc9c0\uc5ed\uc5d0 \ub530\ub77c \ub2ec\ub77c\uc9c8 \uc218 \uc788\uc2b5\ub2c8\ub2e4.",
    "faq2q": "\uc0ac\uc774\uc988 \uad50\ud658\uc740 \uac00\ub2a5\ud55c\uac00\uc694?",
    "faq2a": "\uc218\ub839 \ud6c4 7\uc77c \uc774\ub0b4, \ubbf8\uc0ac\uc6a9 \uc81c\ud488\uc5d0 \ud55c\ud574 \uad50\ud658 \uc2e0\uccad\uc774 \uac00\ub2a5\ud569\ub2c8\ub2e4.",
    "faq3q": "\uc774\ubca4\ud2b8 \ud560\uc778\uc740 \uc911\ubcf5 \uc801\uc6a9\ub418\ub098\uc694?",
    "faq3a": "\uc774\ubca4\ud2b8\ubcc4 \uc815\ucc45\uc5d0 \ub530\ub77c \ub2e4\ub985\ub2c8\ub2e4. \uc0c1\uc138 \ud398\uc774\uc9c0\uc5d0\uc11c \uc870\uac74\uc744 \ud655\uc778\ud574 \uc8fc\uc138\uc694.",
    "foot_p": (
        "\uac10\uc131 \uc2a4\ud0c0\uc77c\ub9c1 \xb7 HTML/CSS/JS \uae30\uc900\uc73c\ub85c DOM \uad6c\uc870\ub97c "
        "\uba85\ud655\ud788 \ud560 \uc218 \uc788\ub294 \uc139\uc158 \ub2e8\uc704 (Requirements)."
    ),
    "foot_support": "\uace0\uac1d \uc9c0\uc6d0",
    "foot_chan": "\ucc44\ub110",
    "foot_order": (
        "\uc139\uc158 \uc21c\uc11c: Hero, \ube0c\ub79c\ub4dc\uc18c\uac1c, \ucd94\ucc9c\ub8e9\ubd81, \ubca0\uc2a4\ud2b8\uc0c1\ud488, "
        "\uc774\ubca4\ud2b8\ubc30\ub108, FAQ, Footer (Notion Page IA)."
    ),
    "css_hero_cap": "\ud788\uc5b4\ub85c \uc774\ubbf8\uc9c0 + \ud5e4\ub4dc\ub77c\uc778 + CTA",
    "mood_a": "\ubb34\ub4dc A",
    "mood_b": "\ubb34\ub4dc B",
    "mood_c": "\ubb34\ub4dc C",
}

PRODUCTS = [
    ("\uc2e4\ud06c \uce58\ub2c8\uc2a4 \ube14\ub77c\uc6b0\uc2a4", "89,000\uc6d0"),
    ("\ud14c\uc77c\ub7ec\ub4dc \ubca8\ud2b8", "102,000\uc6d0"),
    ("\ubbf8\ub2c8 \uce58\ub9c8", "198,000\uc6d0"),
    ("\uce90\uc2dc\ubbf8\uc5b4 \uc138\ud2b8", "128,000\uc6d0"),
    ("\ub808\ub354 \ubbf8\ub2c8 \ubc31", "145,000\uc6d0"),
    ("\uc2dc\uc5b4 \uc11c\uba38 \uce74\ub514\uac74", "72,000\uc6d0"),
]


def build_html() -> str:
    cards = "\n".join(
        f"""        <article class="card">
          <div class="ph"></div>
          <div class="body">
            <h3>{name}</h3>
            <div class="price">{price}</div>
          </div>
        </article>"""
        for name, price in PRODUCTS
    )

    cap = KO["css_hero_cap"].replace("\\", "\\\\").replace('"', '\\"')

    return f"""<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>{KO["title"]}</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Manrope:wght@400;500;600;700&display=swap" rel="stylesheet" />
  <style>
    :root {{
      --ink: #1a1816;
      --muted: #6b6560;
      --paper: #f7f4ef;
      --accent: #8b2942;
      --line: rgba(26, 24, 22, 0.12);
      --radius: 12px;
      --max: 1120px;
    }}
    * {{ box-sizing: border-box; }}
    body {{
      margin: 0;
      font-family: "Manrope", system-ui, sans-serif;
      color: var(--ink);
      background: var(--paper);
      line-height: 1.6;
    }}
    .meta-banner {{
      font-size: 12px;
      color: var(--muted);
      background: #fff;
      border-bottom: 1px solid var(--line);
      padding: 10px 20px;
      text-align: center;
    }}
    .meta-banner a {{ color: var(--accent); text-decoration: none; font-weight: 600; }}
    .meta-banner a:hover {{ text-decoration: underline; }}
    header.site {{
      position: sticky;
      top: 0;
      z-index: 20;
      background: rgba(247, 244, 239, 0.92);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid var(--line);
    }}
    .site-inner {{
      max-width: var(--max);
      margin: 0 auto;
      padding: 16px 24px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 24px;
    }}
    .logo {{
      font-family: "DM Serif Display", Georgia, serif;
      font-size: 1.35rem;
      letter-spacing: 0.02em;
    }}
    nav {{ display: flex; gap: 28px; font-size: 14px; font-weight: 500; }}
    nav a {{ color: var(--ink); text-decoration: none; opacity: 0.85; }}
    nav a:hover {{ opacity: 1; color: var(--accent); }}
    .btn {{
      display: inline-flex;
      align-items: center;
      justify-content: center;
      padding: 12px 22px;
      border-radius: 999px;
      font-weight: 600;
      font-size: 14px;
      border: none;
      cursor: pointer;
      text-decoration: none;
      transition: transform 0.15s ease, box-shadow 0.15s ease;
    }}
    .btn-primary {{ background: var(--ink); color: #fff; }}
    .btn-primary:hover {{
      transform: translateY(-1px);
      box-shadow: 0 8px 24px rgba(26, 24, 22, 0.18);
    }}
    .btn-ghost {{ background: transparent; color: var(--ink); border: 1px solid var(--line); }}
    .hero {{
      max-width: var(--max);
      margin: 0 auto;
      padding: 56px 24px 72px;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 48px;
      align-items: center;
    }}
    @media (max-width: 900px) {{
      .hero {{ grid-template-columns: 1fr; padding-top: 40px; }}
      nav {{ display: none; }}
    }}
    .hero-copy h1 {{
      font-family: "DM Serif Display", Georgia, serif;
      font-size: clamp(2.25rem, 4vw, 3.25rem);
      font-weight: 400;
      line-height: 1.15;
      margin: 0 0 20px;
    }}
    .hero-copy p.lead {{ color: var(--muted); font-size: 1.05rem; max-width: 40ch; margin: 0 0 28px; }}
    .hero-cta {{ display: flex; flex-wrap: wrap; gap: 12px; }}
    .hero-visual {{
      aspect-ratio: 4 / 5;
      border-radius: var(--radius);
      background: linear-gradient(145deg, #e8dfd6 0%, #d4c4b8 45%, #c4a99a 100%);
      position: relative;
      overflow: hidden;
      box-shadow: 0 24px 60px rgba(26, 24, 22, 0.12);
    }}
    .hero-visual::after {{
      content: "{cap}";
      position: absolute;
      bottom: 16px;
      left: 16px;
      right: 16px;
      font-size: 11px;
      color: rgba(255, 255, 255, 0.95);
      text-shadow: 0 1px 4px rgba(0, 0, 0, 0.35);
    }}
    section.block {{ max-width: var(--max); margin: 0 auto; padding: 64px 24px; }}
    section.block.alt {{
      background: #fff;
      border-top: 1px solid var(--line);
      border-bottom: 1px solid var(--line);
    }}
    .section-head {{
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      gap: 16px;
      margin-bottom: 32px;
    }}
    .section-head h2 {{
      font-family: "DM Serif Display", Georgia, serif;
      font-size: 1.75rem;
      font-weight: 400;
      margin: 0;
    }}
    .section-head span {{ font-size: 13px; color: var(--muted); }}
    .brand-grid {{
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 40px;
      align-items: start;
    }}
    @media (max-width: 800px) {{ .brand-grid {{ grid-template-columns: 1fr; }} }}
    .brand-grid p {{ color: var(--muted); margin: 0 0 16px; }}
    .lookbook {{ display: grid; grid-template-columns: repeat(3, 1fr); gap: 12px; }}
    @media (max-width: 700px) {{ .lookbook {{ grid-template-columns: 1fr 1fr; }} }}
    .lookbook figure {{
      margin: 0;
      border-radius: var(--radius);
      overflow: hidden;
      aspect-ratio: 3 / 4;
      background: #e5ddd4;
    }}
    .lookbook figcaption {{ font-size: 12px; color: var(--muted); margin-top: 8px; }}
    .products {{ display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }}
    @media (max-width: 900px) {{ .products {{ grid-template-columns: repeat(2, 1fr); }} }}
    @media (max-width: 520px) {{ .products {{ grid-template-columns: 1fr; }} }}
    .card {{
      background: #fff;
      border-radius: var(--radius);
      border: 1px solid var(--line);
      overflow: hidden;
      display: flex;
      flex-direction: column;
    }}
    .card .ph {{ aspect-ratio: 3 / 4; background: linear-gradient(180deg, #ebe3da, #d8cdc3); }}
    .card .body {{ padding: 16px; }}
    .card h3 {{ font-size: 15px; margin: 0 0 6px; font-weight: 600; }}
    .card .price {{ font-size: 14px; color: var(--muted); }}
    .event-banner {{
      border-radius: var(--radius);
      background: var(--accent);
      color: #fff;
      padding: 28px 32px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 20px;
    }}
    .event-banner h3 {{
      margin: 0 0 6px;
      font-family: "DM Serif Display", Georgia, serif;
      font-size: 1.5rem;
      font-weight: 400;
    }}
    .event-banner p {{ margin: 0; opacity: 0.92; font-size: 14px; }}
    .event-banner .btn {{ background: #fff; color: var(--accent); }}
    .faq {{ max-width: 720px; }}
    details {{ border-bottom: 1px solid var(--line); padding: 16px 0; }}
    details summary {{
      cursor: pointer;
      font-weight: 600;
      list-style: none;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
    }}
    details summary::-webkit-details-marker {{ display: none; }}
    details summary::after {{ content: "+"; font-weight: 400; color: var(--muted); }}
    details[open] summary::after {{ content: "\\2013"; }}
    details p {{ margin: 12px 0 0; color: var(--muted); font-size: 14px; }}
    footer.site-footer {{
      max-width: var(--max);
      margin: 0 auto;
      padding: 48px 24px 80px;
      font-size: 13px;
      color: var(--muted);
      border-top: 1px solid var(--line);
    }}
    footer.site-footer .cols {{
      display: grid;
      grid-template-columns: 2fr 1fr 1fr;
      gap: 32px;
      margin-bottom: 32px;
    }}
    @media (max-width: 700px) {{ footer.site-footer .cols {{ grid-template-columns: 1fr; }} }}
  </style>
</head>
<body>
  <div class="meta-banner">
    Figma:
    <a href="https://www.figma.com/design/OpPfz5I47OthVDB9qY3bCr/mcp_test?node-id=0-1" target="_blank" rel="noopener">mcp_test</a>
    &middot; {KO["talk"]}: <strong>itvdzsuu</strong>
    &middot; {KO["meta1"]}
  </div>

  <header class="site">
    <div class="site-inner">
      <div class="logo">Lumen Atelier</div>
      <nav aria-label="{KO["nav_label"]}">
        <a href="#brand">{KO["nav_brand"]}</a>
        <a href="#lookbook">{KO["nav_look"]}</a>
        <a href="#products">{KO["nav_best"]}</a>
        <a href="#event">{KO["nav_event"]}</a>
        <a href="#faq">FAQ</a>
      </nav>
      <a class="btn btn-primary" href="#event">{KO["cta_event"]}</a>
    </div>
  </header>

  <main>
    <section class="hero" aria-labelledby="hero-title">
      <div class="hero-copy">
        <h1 id="hero-title">{KO["h1"]}</h1>
        <p class="lead">
          {KO["lead"]}
          <span style="display:block;margin-top:8px;font-size:0.9em;">{KO["req_note"]}</span>
        </p>
        <div class="hero-cta">
          <a class="btn btn-primary" href="#products">{KO["btn_shop"]}</a>
          <a class="btn btn-ghost" href="#lookbook">{KO["btn_look"]}</a>
        </div>
      </div>
      <div class="hero-visual" role="img" aria-label="{KO["hero_aria"]}"></div>
    </section>

    <section class="block alt" id="brand">
      <div class="section-head">
        <h2>{KO["brand_h"]}</h2>
        <span>{KO["brand_ia"]}</span>
      </div>
      <div class="brand-grid">
        <div>
          <p>{KO["brand_p1"]}</p>
          <p>{KO["brand_p2"]}</p>
          <a class="btn btn-ghost" href="#event">{KO["brand_btn"]}</a>
        </div>
        <div class="lookbook">
          <figure><div class="ph" style="height:100%"></div><figcaption>{KO["mood_a"]}</figcaption></figure>
          <figure><div class="ph" style="height:100%"></div><figcaption>{KO["mood_b"]}</figcaption></figure>
          <figure><div class="ph" style="height:100%"></div><figcaption>{KO["mood_c"]}</figcaption></figure>
        </div>
      </div>
    </section>

    <section class="block" id="lookbook">
      <div class="section-head">
        <h2>{KO["look_h"]}</h2>
        <span>{KO["look_ia"]}</span>
      </div>
      <div class="lookbook">
        <figure><div class="ph" style="height:100%"></div><figcaption>Office to Evening</figcaption></figure>
        <figure><div class="ph" style="height:100%"></div><figcaption>Weekend Linen</figcaption></figure>
        <figure><div class="ph" style="height:100%"></div><figcaption>Soft Tailoring</figcaption></figure>
      </div>
    </section>

    <section class="block alt" id="products">
      <div class="section-head">
        <h2>{KO["best_h"]}</h2>
        <span>{KO["best_sub"]}</span>
      </div>
      <div class="products">
{cards}
      </div>
    </section>

    <section class="block" id="event">
      <div class="section-head">
        <h2>{KO["ev_h"]}</h2>
        <span>{KO["ev_ia"]}</span>
      </div>
      <div class="event-banner">
        <div>
          <h3>{KO["ev_t"]}</h3>
          <p>{KO["ev_p"]}</p>
        </div>
        <a class="btn" href="#">{KO["ev_btn"]}</a>
      </div>
    </section>

    <section class="block alt" id="faq">
      <div class="section-head">
        <h2>{KO["faq_h"]}</h2>
        <span>{KO["faq_sub"]}</span>
      </div>
      <div class="faq">
        <details>
          <summary>{KO["faq1q"]}</summary>
          <p>{KO["faq1a"]}</p>
        </details>
        <details>
          <summary>{KO["faq2q"]}</summary>
          <p>{KO["faq2a"]}</p>
        </details>
        <details>
          <summary>{KO["faq3q"]}</summary>
          <p>{KO["faq3a"]}</p>
        </details>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="cols">
      <div>
        <strong style="color:var(--ink);font-family:'DM Serif Display',serif;font-size:1.1rem;">Lumen Atelier</strong>
        <p style="margin:12px 0 0;">{KO["foot_p"]}</p>
      </div>
      <div>
        <strong style="color:var(--ink);">{KO["foot_support"]}</strong>
        <p style="margin:8px 0 0;">help@example.com</p>
      </div>
      <div>
        <strong style="color:var(--ink);">{KO["foot_chan"]}</strong>
        <p style="margin:8px 0 0;">TalkToFigma &middot; itvdzsuu</p>
      </div>
    </div>
    <p style="margin:0;">{KO["foot_order"]}</p>
  </footer>
  <script src="https://mcp.figma.com/mcp/html-to-design/capture.js" async></script>
</body>
</html>
"""


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    out = root / "home-page-visualization.html"
    out.write_text(build_html(), encoding="utf-8")
    print(out)


if __name__ == "__main__":
    main()
