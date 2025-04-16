# 📱 Responsive Media

`ResponsiveMedia` is a Flutter utility designed to create **responsive UIs** that adapt seamlessly to different screen sizes and orientations. It provides a centralized and intuitive way to scale typography, spacings, paddings, margins, and widgets. With `ResponsiveMedia`, you can ensure consistent designs across mobile, tablet, and web platforms.

---

## ✨ Features

- 🖥 **Cross-Device Compatibility**: Works seamlessly across all devices, including phones, tablets, and web, in both portrait and landscape modes.
- 🧮 **Auto-Scaling**: Dynamically calculates typography, spacings, and other UI elements based on the shortest screen side.
- 🔧 **Intuitive Extensions**: Use shorthand extensions like `0.02.rh`, `0.05.rw`, and `0.04.rs` to define dimensions relative to screen height, width, or shortest side.
- 🛠 **Predefined Typography & Spacings**: Built-in responsive styles for typography (`h1Style`, `h2Style`, etc.) and consistent spacings with `gapS()`, `gapM()`, etc.
- 🎛 **Customizable Scaling**: Fine-tune scaling globally using an optional `scale` factor.
- 🏗 **Central Initialization**: Initialize once with `.init(context)` and access features globally.

---

## 🚀 Installation

To add `ResponsiveMedia` to your project, follow these steps:

### 1. Add the Dependency

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  responsive_media: ^1.1.3
```

### 2. Fetch the Package

Run the following command to install the package:

```bash
flutter pub get
```

---

## 🔧 Basic Usage

This section explains the basic setup and usage of `ResponsiveMedia`.

### Step 1: Import the Package

Import `ResponsiveMedia` in your Dart file:

```dart
import 'package:responsive_media/responsive_media.dart';
```

### Step 2: Initialize `ResponsiveMedia`

Initialize `ResponsiveMedia` inside the `build` method of your root widget or wrap your `MaterialApp` with a custom builder:

```dart
@override
Widget build(BuildContext context) {
  ResponsiveMedia.init(context); // Initialize here
  return MaterialApp(
    home: MyHomePage(),
  );
}
```

⚠️ **Important**: Initialization must happen before using any `ResponsiveMedia` properties. If not initialized, it will throw an error.

### Step 3: Access `ResponsiveMedia` Anywhere

Once initialized, you can access `ResponsiveMedia` globally using `ResponsiveMedia.instance`.

```dart
final rm = ResponsiveMedia.instance;

Padding(
  padding: rm.defaultPadding, // Responsive padding
  child: Text("Welcome!", style: rm.h1Style), // Responsive text style
);
```

---

## 🖋 Responsive Typography

`ResponsiveMedia` provides pre-defined typography styles that scale dynamically based on the screen size. These styles ensure consistent font sizes on all devices.

### Typography Levels

| Level            | Typical Use Case                     |
|-------------------|--------------------------------------|
| `h1`              | Large headlines or titles           |
| `h2`              | Section titles                      |
| `h3`              | Subtitles or smaller headings       |
| `h4`              | Labels or smaller subtitles         |
| `h5`              | Supporting text or captions         |
| `h6`              | Smallest text, often for hints      |
| `title`           | Highlighted section titles          |
| `subtitle`        | Descriptive subtitles               |
| `body`            | General-purpose paragraph text      |
| `caption`         | Small captions for images or labels |
| `button`          | Button text                         |
| `overline`        | Overline text, often for emphasis   |

---

# 📐 ResponsiveMedia: Typography Sizes and Breakpoints

## Typography Sizes (Responsive Scaling)

This table defines the responsive typography scaling used across different screen sizes (XS to XL). Adjustments are made based on the screen's shortest side to ensure optimal readability and design consistency.

| **Style**   | **XS** | **S** | **M** | **L** | **XL** |
|-------------|--------|-------|-------|-------|--------|
| **h1**      | 20     | 22    | 24    | 26    | 28     |
| **h2**      | 18     | 20    | 22    | 24    | 26     |
| **h3**      | 16     | 18    | 20    | 22    | 24     |
| **h4**      | 15     | 16    | 18    | 20    | 22     |
| **h5**      | 14     | 15    | 16    | 18    | 20     |
| **h6**      | 13     | 14    | 15    | 16    | 18     |
| **title**   | 18     | 19    | 20    | 21    | 22     |
| **subtitle**| 16     | 17    | 18    | 19    | 20     |
| **body**    | 14     | 15    | 16    | 17    | 18     |
| **caption** | 12     | 13    | 14    | 15    | 16     |
| **button**  | 13     | 14    | 15    | 16    | 17     |
| **overline**| 11     | 12    | 13    | 14    | 15     |

---

## 📱 Breakpoints

The following breakpoints define the screen width ranges (shortest side) and their respective categories:

| **Breakpoint** | **Screen Width (shortest side)** |
|-----------------|----------------------------------|
| **XS**         | `< 320`                          |
| **S**          | `>= 320 and < 480`              |
| **M**          | `>= 480 and < 720`              |
| **L**          | `>= 720 and < 1080`             |
| **XL**         | `>= 1080`                       |

---

### ✅ Examples of Typography Use

#### 1. Large Headline (`h1Style`)

```dart
Text(
  'Welcome to Flutter!',
  style: ResponsiveMedia.instance.h1Style, // Dynamically scaled h1
);
```

#### 2. Section Title (`h2Style`)

```dart
Text(
  'Features',
  style: ResponsiveMedia.instance.h2Style, // Dynamically scaled h2
);
```

#### 3. Paragraph Text (`bodyStyle`)

```dart
Text(
  'This is an example of paragraph text, which is dynamically scaled for consistent readability across devices.',
  style: ResponsiveMedia.instance.bodyStyle, // Dynamically scaled paragraph text
);
```

#### 4. Caption Text (`captionStyle`)

```dart
Text(
  'Image description goes here.',
  style: ResponsiveMedia.instance.captionStyle, // Dynamically scaled caption
);
```

#### 5. Button Text (`buttonStyle`)

```dart
TextButton(
  onPressed: () {},
  child: Text(
    'Click Me',
    style: ResponsiveMedia.instance.buttonStyle, // Dynamically scaled button text
  ),
);
```

---

## 🧩 Spacing and Layout

### Predefined Spacing Widgets

`ResponsiveMedia` provides pre-defined spacing widgets like `gapS()`, `gapM()`, and `gapL()` to maintain consistent spacing between UI elements.

#### Spacing Example

```dart
Column(
  children: [
    Text('Step 1', style: ResponsiveMedia.instance.h2Style),
    ResponsiveMedia.instance.gapS(), // Small gap
    Text('Enter your details', style: ResponsiveMedia.instance.bodyStyle),
    ResponsiveMedia.instance.gapM(), // Medium gap
    Text('Step 2', style: ResponsiveMedia.instance.h2Style),
  ],
);
```

---

### Extensions for Height, Width, and Shortest Side

Custom extensions (`.rh`, `.rw`, and `.rs`) simplify dimension calculations for height, width, and shortest side.

#### Responsive Height (`rh`)

```dart
Container(
  height: 0.3.rh, // 30% of the screen height
  color: Colors.blue,
);
```

#### Responsive Width (`rw`)

```dart
Container(
  width: 0.8.rw, // 80% of the screen width
  color: Colors.green,
);
```

#### Responsive Shortest Side (`rs`)

```dart
Container(
  padding: EdgeInsets.all(0.02.rs), // 2% of the shortest side
  child: Text('Responsive Container'),
);
```

---

## 🛠 API Summary

### Typography

| Getter              | Description                  |
|---------------------|------------------------------|
| `h1Style`           | Large heading               |
| `h2Style`           | Medium heading              |
| `h3Style`           | Smaller heading             |
| `h4Style`           | Label or subtitle           |
| `bodyStyle`         | Paragraph text              |
| `captionStyle`      | Small captions              |
| `buttonStyle`       | Button text                 |
| `overlineStyle`     | Overline text for emphasis  |

---

### Spacing and Gaps

| Property         | Description                                           |
|-------------------|-------------------------------------------------------|
| `gap()`          | Provides a custom gap with configurable height and width. |
| `gapXS()`        | Extra-small predefined gap for minimal spacing.        |
| `gapS()`         | Small predefined gap for moderate spacing.             |
| `gapM()`         | Medium predefined gap for typical spacing needs.       |
| `gapL()`         | Large predefined gap for wider spacing.                |
| `gapXL()`        | Extra-large predefined gap for maximum spacing.        |
| `defaultPadding` | Uniform padding applied consistently across widgets.   |
| `spacingXS`      | Extra-small spacing value for dense layouts.           |
| `spacingXL`      | Extra-large spacing value for spacious layouts.        |

---

### Sizing

| Extension   | Description                                |
|-------------|--------------------------------------------|
| `0.2.rh`    | 20% of the screen height                  |
| `0.1.rw`    | 10% of the screen width                   |
| `0.03.rs`   | 3% of the shortest screen side            |

---

## 🔍 Comparison with `flutter_screenutil`

| Feature                  | ResponsiveMedia       | flutter_screenutil |
|--------------------------|-----------------------|--------------------|
| Requires Context?        | ✅ Yes               | ✅ Yes             |
| Uses Shortest Side?      | ✅ Yes               | ❌ No              |
| Predefined TextStyles?   | ✅ Yes               | ❌ No              |
| Orientation Support      | ✅ Yes               | ⚠️ Manual          |
| Lightweight              | ✅ Zero dependencies | ⚠️ Heavier         |

---

## 🏗 Planned Features

### 🚧 Version 1.3.0 (Coming Soon)
- `ResponsiveMediaBuilder`: A widget for automatic context injection.
- **Advanced Breakpoints**: Helpers such as `isMobile`, `isTablet`, `isDesktop`.
- **Theme-Aware Styles**: Support for light and dark mode text styles.

---

Happy coding with `ResponsiveMedia`! 🎉