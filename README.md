# 📱 Responsive Media

`ResponsiveMedia` is a Flutter utility designed to create **responsive UIs** that adapt seamlessly to different screen sizes and orientations. It provides a centralized and intuitive way to scale typography, spacings, paddings, margins, and widgets. With `ResponsiveMedia`, you can ensure consistent designs across mobile, tablet, and web platforms.

---

## ✨ Features

- 🖥 **Cross-Device Compatibility**: Works seamlessly across all devices, including phones, tablets, and web, in both portrait and landscape modes.
- 🧮 **Auto-Scaling**: Dynamically calculates typography, spacings, and other UI elements based on the shortest screen side.
- 🔧 **Intuitive Extensions**: Use shorthand extensions like `0.02.rh`, `0.05.rw`, and `0.04.rs` to define dimensions relative to screen height, width, or shortest side.
- 🛠 **Predefined Typography & Spacings**: Built-in responsive sizes for typography (`h1`, `h2`, etc.) and consistent spacings with `gapS()`, `gapM()`, etc.
- 🎛 **Customizable Scaling**: Fine-tune scaling globally using an optional `scale` factor.
- 🏗 **Central Initialization**: Initialize once with `.init(context)` and access features globally.

---

## 🚀 Installation

To add `ResponsiveMedia` to your project, follow these steps:

### 1. Add the Dependency

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  responsive_media: ^1.2.0
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

#### Example:

```dart
final rm = ResponsiveMedia.instance;

Padding(
  padding: rm.defaultPadding, // Responsive padding
  child: Text(
    "Welcome!",
    style: TextStyle(
      fontSize: rm.h1, // Responsive size
    ),
  ),
);

ElevatedButton(
  onPressed: () {},
  child: Text(
    "Click Here",
    style: TextStyle(
      fontSize: rm.buttonText, // Responsive button text
    ),
  ),
);
```

---

## 📏 Using `shortestSide` for Responsive Widget Sizing

The `shortestSide` value allows you to build responsive layouts that scale proportionally on both portrait and landscape screens, including tablets and foldable devices.

### ✨ Why Use `shortestSide`?

- 📱 Works great for portrait and landscape orientations.
- 🧠 Ensures consistent spacing and sizing across various screen dimensions.
- 📐 Especially useful for widgets like `Container`, `SizedBox`, `Padding`, `Margins`, etc.

#### Example:

```dart
Container(
  height: rm.shortestSide * 0.2, // 20% of shortest screen dimension
  width: rm.screenWidth,         // Full screen width
  child: RichText(
    text: TextSpan(
      text: "Login Account \n",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: rm.h1 * 1.5, // Scaled responsive headline
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: "Please login into your account",
          style: TextStyle(
            fontSize: rm.h2, // Base responsive subtitle
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
```

---

# Responsive Orientation Utilities

This package provides utility methods to handle responsive design based on screen orientation. It includes functionality to determine whether the screen is in portrait or landscape mode and to provide responsive values based on the current orientation.

## Features

### 1. `isPortrait`
Determine if the screen is in **portrait mode**.

```dart
bool get isPortrait => orientation == Orientation.portrait;
```

#### Example:
```dart
if (rm.isPortrait) {
  print('The screen is in portrait mode!');
} else {
  print('The screen is not in portrait mode.');
}
```

### 2. `isLandscape`
Determine if the screen is in **landscape mode**.

```dart
bool get isLandscape => orientation == Orientation.landscape;
```

#### Example:
```dart
final rm = ResponsiveMedia.instance;
if (rm.isLandscape) {
  print('The screen is in landscape mode!');
} else {
  print('The screen is not in landscape mode.');
}
```

### 3. `getResponsiveBox`
Get a responsive value based on the current screen orientation.

```dart
double getResponsiveBox(double portraitValue, double landscapeValue) {
  return isPortrait ? portraitValue : landscapeValue;
}
```

#### Parameters:
- `portraitValue`: The value to use for **portrait orientation**.
- `landscapeValue`: The value to use for **landscape orientation**.

#### Example:
```dart
double boxSize = rm.getResponsiveBox(100, 200);
print('Box size: $boxSize'); 
// Outputs 100 in portrait mode, 200 in landscape mode.
```

## Usage Examples

### Example 1: Adjusting Widget Size Based on Orientation
```dart
Widget build(BuildContext context) {
  ResponsiveMedia.init(context); // Initialize ResponsiveMedia
final rm = ResponsiveMedia.instance;
  return Container(
    width:rm.getResponsiveBox(150, 300),
    height: rm.getResponsiveBox(100, 200),
    color: Colors.blue,
    child: Center(
      child: Text(
        rm.isPortrait
            ? 'Portrait Mode'
            : 'Landscape Mode',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}
```

### Example 2: Dynamic Padding for Orientation
```dart
final rm = ResponsiveMedia.instance;
EdgeInsets padding = rm.getResponsiveBox(
  EdgeInsets.symmetric(horizontal: 16, vertical: 24), // Portrait padding
  EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Landscape padding
);

return Padding(
  padding: padding,
  child: Text('Responsive Padding Example'),
);
```


## 🖋 Responsive Typography

`ResponsiveMedia` provides pre-defined typography styles that scale dynamically based on the screen size. These styles ensure consistent font sizes on all devices.

### Typography Levels

| Level      | Typical Use Case                                      |
|------------|-------------------------------------------------------|
| `h1`       | Page titles or major headlines                        |
| `h2`       | Section headers                                       |
| `h3`       | Subsection headers or prominent subtitles             |
| `h4`       | Smaller section labels or content headers             |
| `h5`       | Supporting information or medium emphasis             |
| `h6`       | Least prominent headings or field hints               |
| `title`    | Featured titles, cards, or callouts                  |
| `subtitle` | Descriptive text below titles                         |
| `body`     | Standard content text or paragraphs                  |
| `caption`  | Secondary labels, annotations, or image tags          |
| `button`   | Text inside buttons or interactive elements           |
| `overline` | Uppercase labels above headings or cards              |

---

## 📐 Typography Sizes and Breakpoints

### Typography Sizes (Responsive Scaling)

This table defines the responsive typography scaling used across different screen sizes (XS to XL). Adjustments are made based on the screen's shortest side to ensure optimal readability and design consistency.

| Style         | XS  | S   | M   | L   | XL  |
|---------------|-----|-----|-----|-----|-----|
| `h1`          | 20  | 22  | 24  | 26  | 28  |
| `h2`          | 18  | 20  | 22  | 24  | 26  |
| `h3`          | 16  | 18  | 20  | 22  | 24  |
| `h4`          | 15  | 16  | 18  | 20  | 22  |
| `h5`          | 14  | 15  | 16  | 18  | 20  |
| `h6`          | 13  | 14  | 15  | 16  | 18  |
| `title`       | 26  | 30  | 33  | 37  | 41  |
| `subtitle`    | 22  | 26  | 30  | 33  | 37  |
| `body`        | 18  | 22  | 26  | 30  | 33  |
| `caption`     | 15  | 18  | 22  | 26  | 30  |
| `buttonText`  | 13  | 14  | 15  | 16  | 17  |
| `overline`    | 13  | 17  | 20  | 24  | 28  |

---

## 📱 Breakpoints

| **Breakpoint** | **Screen Width (shortest side)** |
|-----------------|----------------------------------|
| **XS**         | `< 320`                          |
| **S**          | `>= 320 and < 480`              |
| **M**          | `>= 480 and < 720`              |
| **L**          | `>= 720 and < 1080`             |
| **XL**         | `>= 1080`                       |

✅ **Examples of Typography Use**

Here are some common examples of how to use responsive typography in your app:

```dart
final rm = ResponsiveMedia.instance;

// Example 1: Large Headline (h1)
Text(
  'Welcome to Flutter!',
  style: TextStyle(
    fontSize: rm.h1,
    fontWeight: FontWeight.bold,
  ),
);

// Example 2: Section Title (h2)
Text(
  'Features',
  style: TextStyle(
    fontSize: rm.h2,
    fontWeight: FontWeight.w600,
  ),
);
```

---

## 🧩 Spacing and Layout

### Predefined Spacing Widgets

`ResponsiveMedia` provides pre-defined spacing widgets like `gapS()`, `gapM()`, and `gapL()` to maintain consistent spacing between UI elements.

#### Example:

```dart

final rm = ResponsiveMedia.instance;

Column(
  children: [
    // Using rm.h1 for responsive font size for the heading
    Text(
      'Step 1',
      style: TextStyle(
        fontSize: rm.h1, // Responsive font size for a large heading
        fontWeight: FontWeight.bold,
      ),
    ),

    // Using rm.gapS() for a small gap to maintain consistent spacing
    rm.gapS(), // Adds a small responsive gap between widgets

    // Using rm.h2 for a smaller heading size
    Text(
      'Enter your details',
      style: TextStyle(
        fontSize: rm.h2, // Responsive font size for a smaller heading
        fontWeight: FontWeight.bold,
      ),
    ),

    // Using rm.gapM() for a medium gap to visually separate sections
    rm.gapM(), // Adds a medium responsive gap

    // Using rm.h2 for consistent styling of headings
    Text(
      'Step 2',
      style: TextStyle(
        fontSize: rm.h2, // Responsive font size for another smaller heading
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
);
```

---



### Extensions for Height, Width, and Shortest Side

Custom extensions (`.rh`, `.rw`, and `.rs` and `.rl`) simplify dimension calculations for height, width, and shortest  and longest.

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

#### Responsive Logest Side (`rl`)

```dart
Container(
  padding: EdgeInsets.all(0.02.rl), // 2% of the logest side
  child: Text('Responsive Container'),
);
```

---

## 🛠 API Summary

### Typography

| Getter              | Description                  |
|---------------------|------------------------------|
| `h1`           | Large heading               |
| `h2`           | Medium heading              |
| `h3`           | Smaller heading             |
| `h4`           | Label or subtitle           |
| `body`         | Paragraph text              |
| `caption`      | Small captions              |
| `buttonText`       | Button text                 |
| `overline`     | Overline text for emphasis  |

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
| `0.03.rl`   | 3% of the  longest screen side            |

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


## Summary Table

| **Feature**            | **Description**                                                                                | **Example Usage**                                                                 |
|------------------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| **`isPortrait`**       | Returns `true` if the screen orientation is in **portrait** mode.                              | `if (ResponsiveMedia.instance.isPortrait) print('Portrait Mode');`                |
| **`isLandscape`**      | Returns `true` if the screen orientation is in **landscape** mode.                             | `if (ResponsiveMedia.instance.isLandscape) print('Landscape Mode');`              |
| **`getResponsiveBox`** | Dynamically returns a value based on the current orientation. Accepts `portraitValue` and `landscapeValue`. | `double size = ResponsiveMedia.instance.getResponsiveBox(100, 200);` |   

---

          |

## 🏗 Planned Features

### 🚧 Version 1.3.0 (Coming Soon)
- `ResponsiveMediaBuilder`: A widget for automatic context injection.
- **Advanced Breakpoints**: Helpers such as `isMobile`, `isTablet`, `isDesktop`.
- **Theme-Aware Styles**: Support for light and dark mode text styles.

---

Happy coding with `ResponsiveMedia`! 🎉