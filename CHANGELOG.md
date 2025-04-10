# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2025-04-10

### 🎉 Initial Release

- Introduced `ResponsiveMedia.init(context)` for static global access.
- Responsive scaling based on `MediaQuery.of(context).size.shortestSide`.
- Extensions added for:
  - `.rh` → % of screen height
  - `.rw` → % of screen width
  - `.rs` → % of shortest side
- Built-in responsive text styles:
  - `h1Style`, `h2Style`, `pStyle`
- Built-in spacing widgets:
  - `gapS()`, `gapM()`, etc.
- Standardized paddings:
  - `defaultPadding`, margin helpers
- Works seamlessly across mobile, tablet, web, and landscape mode.
- Customizable scale factor for fine-tuning design.

---

## Coming Soon (Planned)

### 🚧 [1.1.0] - TBD

- `ResponsiveMediaBuilder` widget for automatic context injection.
- More typography levels: `h3Style` through `h6Style`.
- Color-aware themes: light/dark mode text styles.
- Breakpoint helpers like `isMobile`, `isTablet`, `isDesktop`.

