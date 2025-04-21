# Changelog

All notable changes to this project will be documented in this file.

## [1.1.3] - 2025-04-21

- Just `ReadMe.md` updated.

 - `.rl` → % of Longest side added
 


- Just `ReadMe.md` updated and some minor issues fixed.

## [1.1.1] - 2025-04-16

- Just `ReadMe.md` updated

## [1.1.0] - 2025-04-16

### ✨ Summary
This release focuses on improving responsiveness with dynamic breakpoints, typography, and shorthand extensions for responsive values.

### 🚀 New Features
- **Dynamic Breakpoints**:
  - Introduced breakpoints (`XS`, `S`, `M`, `L`, `XL`) for responsive scaling.
  - Sizes dynamically adjust based on `shortestSide` and `screenWidth`.
- **Long Side Support**:
  - Added `longestSide` for responsive calculations in landscape and large screens.
- **Custom Gap Widgets**:
  - Added a `gap()` method that accepts custom widgets or sizes.
  - Predefined gaps like `gapXS()`, `gapS()`, `gapM()`, `gapL()`, and `gapXL()` are still available.
- **Responsive Typography**:
  - Added fully dynamic typography text styles for `h1` to `h6`, `title`, `subtitle`, `body`, `caption`, `button`, and `overline`.
  - Sizes are now dynamically calculated using `shortestSide` and breakpoints.
- **Shorthand Extensions**:
  - Introduced extensions for responsive values (`rh`, `rw`, `rs`) to calculate height, width, and shortest side percentages with ease.
    - Example: `50.rh` → 50% of screen height, `30.rw` → 30% of screen width.
- **Improved Padding and Margins**:
  - Standardized dynamic padding (`defaultPadding`, `verticalPadding`, `horizontalPadding`) and margin helpers (`marginXS`, `marginS`, etc.).
- **Global Responsiveness**:
  - All sizes and styles now scale uniformly with a customizable `scale` factor.

### 🔧 Fixes
- Fixed issues with scaling for smaller devices.
- Resolved padding inconsistencies in portrait and landscape orientations.

---

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

### 🚧 [1.2.0] - TBD
- `ResponsiveMediaBuilder` widget for automatic context injection.
- More typography levels: `h3Style` through `h6Style`.
- Color-aware themes: light/dark mode text styles.
- Breakpoint helpers like `isMobile`, `isTablet`, `isDesktop`.