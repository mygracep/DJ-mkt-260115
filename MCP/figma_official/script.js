const toggleButton = document.getElementById("theme-toggle");
const storageKey = "preferred-theme";

function applyTheme(theme) {
  const isDark = theme === "dark";
  document.body.classList.toggle("dark", isDark);
  toggleButton.textContent = isDark ? "Light Mode" : "Dark Mode";
  toggleButton.setAttribute(
    "aria-label",
    isDark ? "라이트모드 전환" : "다크모드 전환"
  );
}

function getInitialTheme() {
  const saved = localStorage.getItem(storageKey);
  if (saved === "dark" || saved === "light") {
    return saved;
  }

  return window.matchMedia("(prefers-color-scheme: dark)").matches
    ? "dark"
    : "light";
}

let currentTheme = getInitialTheme();
applyTheme(currentTheme);

toggleButton.addEventListener("click", () => {
  currentTheme = currentTheme === "dark" ? "light" : "dark";
  localStorage.setItem(storageKey, currentTheme);
  applyTheme(currentTheme);
});
