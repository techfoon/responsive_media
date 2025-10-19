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
  responsive_media: ^1.2.3-beta.1
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
  padding: rm.paddingAll(5), // Responsive padding : 5% of padding from all
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
| `h1`          | 26  | 28  | 30  | 32  | 36  |
| `h2`          | 22  | 24  | 26  | 28  | 32  |
| `h3`          | 18  | 20  | 22  | 24  | 26  |
| `h4`          | 16  | 18  | 20  | 22  | 24  |
| `h5`          | 15  | 16  | 18  | 20  | 22  |
| `h6`          | 14  | 15  | 16  | 18  | 20  |
| `title`       | 26  | 28  | 30  | 32  | 36  |
| `subtitle`    | 22  | 24  | 26  | 28  | 32  |
| `body`        | 18  | 20  | 22  | 24  | 26  |
| `caption`     | 16  | 18  | 20  | 22  | 24  |
| `buttonText`  | 14  | 16  | 18  | 20  | 22  |
| `overline`    | 14  | 16  | 18  | 20  | 22  |

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

# Gap Utility

The `gap` utility is a flexible and responsive tool for adding gaps or spacing between widgets in Flutter applications. It supports both vertical and horizontal gaps and scales dynamically based on the device's screen size and orientation.

---

## Features

- **Responsive Design**: Dynamically adjusts spacing sizes (`XS`, `S`, `M`, `L`, `XL`) based on the device's dimensions.
- **Custom Gaps**: Allows specifying custom-sized gaps with optional scaling.
- **Orientation Support**: Easily switch between vertical and horizontal gaps using `isHorizontal`.
- **Predefined Gap Sizes**:

  - `gapXS`
  - `gapS`
  - `gapM`
  - `gapL`
  - `gapXL`

---

## Usage

### 1. **Adding a Gap**

The `gap` method dynamically creates a gap of the specified size. It accepts the following parameters:
- `customWidget`: A custom widget to use as a gap (optional).
- `size`: The size of the gap (optional).
- `isHorizontal`: If `true`, creates a horizontal gap; otherwise, creates a vertical gap (default is `false`).

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

// Add a gap of size 5 (vertical by default)
rm.gap(
  size: 5, // Specifies the size of the gap
);
```

---

### 2. **Using Predefined Gaps**

Predefined gap sizes make it easier to add consistent spacing across your app.

#### Example for Vertical Gaps:

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

// Add vertical gaps in a Column
Column(
  children: [
    Text('Item 1'), // First item
    rm.gapS(), // Adds a small vertical gap
    Text('Item 2'), // Second item
    rm.gapM(), // Adds a medium vertical gap
    Text('Item 3'), // Third item
  ],
);
```
**Explanation:**
- `gapS()` adds a small vertical gap between `Item 1` and `Item 2`.
- `gapM()` adds a medium vertical gap between `Item 2` and `Item 3`.

---

#### Example for Horizontal Gaps:

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

// Add horizontal gaps in a Row
Row(
  children: [
    Icon(Icons.star), // First icon
    rm.gapS(isHorizontal: true), // Adds a small horizontal gap
    Icon(Icons.star), // Second icon
    rm.gapM(isHorizontal: true), // Adds a medium horizontal gap
    Icon(Icons.star), // Third icon
  ],
);
```
**Explanation:**
- `gapS(isHorizontal: true)` adds a small horizontal gap between the first and second icons.
- `gapM(isHorizontal: true)` adds a medium horizontal gap between the second and third icons.

---

### 3. **Custom Scaling**

You can apply custom scaling to predefined gaps by passing the `scale` parameter.

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

// Add a large gap with custom scaling
rm.gapL(scale: 1.5); // Makes the large gap 1.5x bigger
```
**Explanation:**
- The `scale` parameter multiplies the default size of the gap, making it larger or smaller based on your needs.
- In this example, the large gap (`gapL`) is scaled up by 1.5 times.

---

### Examples

#### **Example 1: Vertical Gaps in a Column**

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

Column(
  children: [
    Text(
      'Header', 
      style: TextStyle(fontSize: rm.h1), // Dynamically scaled heading text
    ),
    rm.gapL(), // Adds a large vertical gap after the header
    Text(
      'Subheader', 
      style: TextStyle(fontSize: rm.h2), // Dynamically scaled subheading text
    ),
    rm.gapM(), // Adds a medium vertical gap after the subheader
    ElevatedButton(
      onPressed: () {}, 
      child: Text('Click Me'), // A button with no gap below
    ),
  ],
);
```
**Explanation:**
- `gapL()` adds a large vertical gap after the header text.
- `gapM()` adds a medium vertical gap after the subheader text.

---

#### **Example 2: Horizontal Gaps in a Row**

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

Row(
  mainAxisAlignment: MainAxisAlignment.center, // Centers all children
  children: [
    Icon(Icons.arrow_back), // Back arrow icon
    rm.gapS(isHorizontal: true), // Adds a small horizontal gap
    Text('Go Back'), // Text in the middle of the row
    rm.gapM(isHorizontal: true), // Adds a medium horizontal gap
    Icon(Icons.arrow_forward), // Forward arrow icon
  ],
);
```
**Explanation:**
- `gapS(isHorizontal: true)` adds a small horizontal gap between the back arrow and the text.
- `gapM(isHorizontal: true)` adds a medium horizontal gap between the text and the forward arrow.

---


# Margin and Padding Utility

This utility provides responsive and flexible tools for applying **margins** and **padding** to widgets in Flutter applications. The sizes dynamically adjust based on the device's screen dimensions and orientation, ensuring consistent layouts across various screen sizes.

---

## Features

- **Responsive Design**: Dynamically calculates margins and padding as percentages of the screen dimensions.
- **Orientation Support**: Automatically adapts to portrait and landscape modes.
- **Customizable Sizes**: Apply margins and padding to individual or all sides of a widget.
- **Predefined Methods**:
  - Margin: `marginAll`, `marginVertical`, `marginHorizontal`
  - Padding: `paddingAll`, `paddingVertical`, `paddingHorizontal`

---

## Notes

- All margin and padding values are calculated as a **percentage of the screen's shortest dimension** (e.g., width in portrait mode).
- This ensures that the spacing scales proportionally across different screen sizes and orientations.

---

## Margin

### Usage

#### 1. **Adding Margin to All Sides**
Use the `marginAll` method to apply equal margins to all sides of a widget.

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

// Add margin to all sides
Container(
  margin: rm.marginAll(5), // Adds margin as 5% of the screen's shortest dimension
  child: Text('Content with margin'),
);
```

#### 2. **Adding Vertical or Horizontal Margins**
Use `marginVertical` for top and bottom margins, and `marginHorizontal` for left and right margins.

```dart
// Vertical margin
Container(
  margin: rm.marginVertical(4), // Adds vertical margin (top and bottom) as 4% of the shortest dimension
  child: Text('Vertical Margin Example'),
);

// Horizontal margin
Container(
  margin: rm.marginHorizontal(3), // Adds horizontal margin (left and right) as 3% of the shortest dimension
  child: Text('Horizontal Margin Example'),
);
```

#### 3. **Combining Margins**
You can also use `EdgeInsets.only` with `marginVertical` or `marginHorizontal` to customize specific sides.

```dart
Container(
  margin: EdgeInsets.only(
    top: rm.marginVertical(3).top, // Top margin as 3% of the shortest dimension
    left: rm.marginHorizontal(2).left, // Left margin as 2% of the shortest dimension
  ),
  child: Text('Custom Margins Example'),
);
```

---

## Padding

### Usage

#### 1. **Adding Padding to All Sides**
Use the `paddingAll` method to apply equal padding to all sides of a widget.

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

// Add padding to all sides
Container(
  padding: rm.paddingAll(5), // Adds padding as 5% of the screen's shortest dimension
  child: Text('Content with padding'),
);
```

#### 2. **Adding Vertical or Horizontal Padding**
Use `paddingVertical` for top and bottom padding, and `paddingHorizontal` for left and right padding.

```dart
// Vertical padding
Container(
  padding: rm.paddingVertical(4), // Adds vertical padding (top and bottom) as 4% of the shortest dimension
  child: Text('Vertical Padding Example'),
);

// Horizontal padding
Container(
  padding: rm.paddingHorizontal(3), // Adds horizontal padding (left and right) as 3% of the shortest dimension
  child: Text('Horizontal Padding Example'),
);
```

#### 3. **Combining Padding**
You can also use `EdgeInsets.only` with `paddingVertical` or `paddingHorizontal` to customize specific sides.

```dart
Container(
  padding: EdgeInsets.only(
    top: rm.paddingVertical(3).top, // Top padding as 3% of the shortest dimension
    left: rm.paddingHorizontal(2).left, // Left padding as 2% of the shortest dimension
  ),
  child: Text('Custom Padding Example'),
);
```

---

## Examples

### **Example 1: Applying Both Margin and Padding**

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

Container(
  margin: rm.marginAll(5), // Adds margin as 5% of the screen's shortest dimension to all sides
  padding: rm.paddingAll(3), // Adds padding as 3% of the screen's shortest dimension to all sides
  child: Text(
    'Text with Margin and Padding',
    style: TextStyle(fontSize: rm.h2), // Dynamically scaled text size
  ),
);
```

### **Example 2: Vertical and Horizontal Margins and Padding**

```dart
// Create an instance of ResponsiveMedia
final rm = ResponsiveMedia.instance;

Container(
  margin: rm.marginVertical(4), // Adds vertical margin (top and bottom) as 4% of the shortest dimension
  padding: rm.paddingHorizontal(3), // Adds horizontal padding (left and right) as 3% of the shortest dimension
  child: Text('Text with Vertical Margin and Horizontal Padding'),
);
```



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


## 🎯 Advanced Breakpoints

### Device Type Detection

Easily detect device types with simple boolean checks:

```dart
final responsive = ResponsiveMedia.instance;

if (responsive.isMobile) {
  // Mobile layout (width < 768px)
  return MobileLayout();
}

if (responsive.isTablet) {
  // Tablet layout (width 768px - 1024px)
  return TabletLayout();
}

if (responsive.isDesktop) {
  // Desktop layout (width >= 1024px)
  return DesktopLayout();
}
```

### Setup Custom Breakpoints

Configure custom breakpoints before initializing ResponsiveMedia:

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          // Configure breakpoints BEFORE init
          ResponsiveMediaBreakpointConfig.configure(
            customBreakpoints: {
              'phone': 375,
              'tablet': 768,
              'laptop': 1200,
              'desktop': 1920,
              '4K': 2560,
            },
            mobileBreakpoint: 600,
            tabletBreakpoint: 1024,
          );
          
          // Initialize ResponsiveMedia
          ResponsiveMedia.init(context);
          
          return MyHomePage();
        },
      ),
    );
  }
}
```

### Custom Breakpoint Methods

```dart
final rm = ResponsiveMedia.instance;

// Check if current width matches breakpoint
if (rm.isBreakpoint('tablet')) {
  print('Tablet breakpoint active');
}

// Check if larger than breakpoint
if (rm.largerThan('laptop')) {
  print('Screen is larger than laptop');
}

// Check if smaller than breakpoint
if (rm.smallerThan('desktop')) {
  print('Screen is smaller than desktop');
}

// Check if between two breakpoints
if (rm.between('tablet', 'laptop')) {
  print('Screen is between tablet and laptop');
}

// Get current active breakpoint name
print('Current: ${rm.currentBreakpoint}');
```

### Predefined Breakpoint Sets

Use industry-standard breakpoint sets:

#### Bootstrap Breakpoints
```dart
ResponsiveMediaBreakpointConfig.configure(
  customBreakpoints: CommonBreakpoints.bootstrap,
);
// xs: 0, sm: 576, md: 768, lg: 992, xl: 1200, xxl: 1400
```

#### Material Design Breakpoints
```dart
ResponsiveMediaBreakpointConfig.configure(
  customBreakpoints: CommonBreakpoints.material,
);
// compact: 0, medium: 600, expanded: 840, large: 1240, extraLarge: 1600
```

#### Tailwind CSS Breakpoints
```dart
ResponsiveMediaBreakpointConfig.configure(
  customBreakpoints: CommonBreakpoints.tailwind,
);
// sm: 640, md: 768, lg: 1024, xl: 1280, 2xl: 1536
```

#### Device-Specific Breakpoints
```dart
ResponsiveMediaBreakpointConfig.configure(
  customBreakpoints: CommonBreakpoints.devices,
);
// mobileSmall: 320, mobileMedium: 375, mobileLarge: 425,
// tablet: 768, laptop: 1024, laptopLarge: 1440, desktop: 1920, 4k: 2560
```

#### Apple Device Breakpoints
```dart
ResponsiveMediaBreakpointConfig.configure(
  customBreakpoints: CommonBreakpoints.apple,
);
// iPhoneSE: 375, iPhone: 390, iPhoneMax: 428, iPadMini: 768,
// iPad: 810, iPadPro: 1024, macBook: 1440, iMac: 1920
```

#### Web-Focused Breakpoints
```dart
ResponsiveMediaBreakpointConfig.configure(
  customBreakpoints: CommonBreakpoints.web,
);
// mobile: 480, tablet: 768, desktop: 1024, wide: 1440, ultraWide: 1920
```

### Helper Methods

#### valueByDevice

Return different values based on device type:

```dart
Container(
  width: responsive.valueByDevice(
    mobile: 300.0,
    tablet: 500.0,
    desktop: 800.0,
  ),
  padding: EdgeInsets.all(
    responsive.valueByDevice(
      mobile: 16.0,
      tablet: 24.0,
      desktop: 32.0,
    ),
  ),
  child: Text(
    'Responsive Container',
    style: TextStyle(
      fontSize: responsive.valueByDevice(
        mobile: 14.0,
        tablet: 18.0,
        desktop: 24.0,
      ),
    ),
  ),
);
```

#### valueByBreakpoint

Return values based on custom breakpoints:

```dart
final fontSize = responsive.valueByBreakpoint(
  breakpointValues: {
    'phone': 12.0,
    'tablet': 16.0,
    'laptop': 20.0,
    'desktop': 24.0,
  },
  defaultValue: 16.0,
);

Text('Dynamic Font', style: TextStyle(fontSize: fontSize));
```

---

## 📚 Complete Usage Examples

### Example 1: Simple Responsive Layout

```dart
class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rm = ResponsiveMedia.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout'),
      ),
      body: Padding(
        padding: rm.paddingAll(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: rm.h1,
                fontWeight: FontWeight.bold,
              ),
            ),
            rm.gapM(),
            if (rm.isMobile)
              _buildMobileContent(rm)
            else if (rm.isTablet)
              _buildTabletContent(rm)
            else
              _buildDesktopContent(rm),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileContent(ResponsiveMedia rm) {
    return Column(
      children: [
        Text('Mobile Layout', style: TextStyle(fontSize: rm.h3)),
        rm.gapS(),
        Text('Optimized for small screens'),
      ],
    );
  }

  Widget _buildTabletContent(ResponsiveMedia rm) {
    return Row(
      children: [
        Expanded(
          child: Text('Tablet Layout', style: TextStyle(fontSize: rm.h3)),
        ),
        rm.gapM(isHorizontal: true),
        Expanded(
          child: Text('Two column layout'),
        ),
      ],
    );
  }

  Widget _buildDesktopContent(ResponsiveMedia rm) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text('Main Content')),
        rm.gapL(isHorizontal: true),
        Expanded(flex: 1, child: Text('Sidebar')),
      ],
    );
  }
}
```

### Example 2: Responsive Grid

```dart
class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rm = ResponsiveMedia.instance;

    return GridView.builder(
      padding: rm.paddingAll(4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rm.valueByDevice(
          mobile: 1,
          tablet: 2,
          desktop: 4,
        ),
        mainAxisSpacing: rm.spacingM,
        crossAxisSpacing: rm.spacingM,
        childAspectRatio: 1.5,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Item ${index + 1}',
              style: TextStyle(
                fontSize: rm.body,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
```

### Example 3: Custom Breakpoints

```dart
class CustomBreakpointPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rm = ResponsiveMedia.instance;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current: ${rm.currentBreakpoint}'),
            rm.gapM(),
            
            if (rm.isBreakpoint('4K'))
              _build4KLayout()
            else if (rm.isBreakpoint('desktop'))
              _buildDesktopLayout()
            else if (rm.isBreakpoint('laptop'))
              _buildLaptopLayout()
            else if (rm.isBreakpoint('tablet'))
              _buildTabletLayout()
            else
              _buildPhoneLayout(),
          ],
        ),
      ),
    );
  }

  Widget _build4KLayout() => Text('4K Ultra HD Display');
  Widget _buildDesktopLayout() => Text('Desktop Display');
  Widget _buildLaptopLayout() => Text('Laptop Display');
  Widget _buildTabletLayout() => Text('Tablet Display');
  Widget _buildPhoneLayout() => Text('Phone Display');
}
```

### Example 4: Responsive Card

```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rm = ResponsiveMedia.instance;

    return Container(
      width: rm.valueByDevice(
        mobile: double.infinity,
        tablet: 500,
        desktop: 600,
      ),
      margin: rm.marginAll(3),
      padding: rm.paddingAll(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Title',
            style: TextStyle(
              fontSize: rm.h3,
              fontWeight: FontWeight.bold,
            ),
          ),
          rm.gapS(),
          Text(
            'Card description text that adapts to screen size.',
            style: TextStyle(fontSize: rm.body),
          ),
          rm.gapM(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Action',
                  style: TextStyle(fontSize: rm.buttonText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Example 5: Responsive Navigation

```dart
class ResponsiveScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rm = ResponsiveMedia.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Nav'),
        actions: rm.isDesktop
            ? [
                TextButton(
                  onPressed: () {},
                  child: Text('Home'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('About'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Contact'),
                ),
              ]
            : null,
      ),
      drawer: rm.isMobile || rm.isTablet
          ? Drawer(
              child: ListView(
                children: [
                  DrawerHeader(child: Text('Menu')),
                  ListTile(title: Text('Home')),
                  ListTile(title: Text('About')),
                  ListTile(title: Text('Contact')),
                ],
              ),
            )
          : null,
      body: Center(child: Text('Content')),
    );
  }
}
```

---

## 🎨 Advanced Configuration

### Custom Scaling

```dart
// Global scaling
ResponsiveMedia.init(context, scale: 1.2);

// Or custom dimensions
ResponsiveMedia.init(
  context,
  customHeight: 800,
  customWidth: 1200,
  scale: 1.1,
);
```

### Dynamic Breakpoint Management

```dart
// Add breakpoint
ResponsiveMediaBreakpointConfig.addBreakpoint('ultraWide', 2560);

// Check if exists
bool exists = ResponsiveMediaBreakpointConfig.hasBreakpoint('ultraWide');

// Get value
double? value = ResponsiveMediaBreakpointConfig.getBreakpointValue('ultraWide');

// Get all names
List<String> names = ResponsiveMediaBreakpointConfig.breakpointNames;

// Remove breakpoint
ResponsiveMediaBreakpointConfig.removeBreakpoint('ultraWide');

// Reset to defaults
ResponsiveMediaBreakpointConfig.reset();
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


# Margin and Padding Summary Table

This table provides a quick overview of the predefined methods for applying **margins** and **padding** in Flutter applications using the `ResponsiveMedia` utility.

| **Type**  | **Method**           | **Description**                                                                                               | **Value**                     |
|-----------|----------------------|---------------------------------------------------------------------------------------------------------------|--------------------------------|
| **Margin**| `marginAll`          | Adds equal margins to all sides of the widget.                                                                | Percentage of the screen's shortest dimension. |
| **Margin**| `marginVertical`     | Adds margins to the top and bottom sides of the widget.                                                       | Percentage of the screen's shortest dimension. |
| **Margin**| `marginHorizontal`   | Adds margins to the left and right sides of the widget.                                                       | Percentage of the screen's shortest dimension. |
| **Padding**| `paddingAll`         | Adds equal padding to all sides of the widget.                                                                | Percentage of the screen's shortest dimension. |
| **Padding**| `paddingVertical`    | Adds padding to the top and bottom sides of the widget.                                                       | Percentage of the screen's shortest dimension. |
| **Padding**| `paddingHorizontal`  | Adds padding to the left and right sides of the widget.                                                       | Percentage of the screen's shortest dimension. |

---

## Notes:
1. **Values in Percentage**: All values (e.g., `5`, `3`, `4`) are interpreted as percentages of the screen's **shortest dimension**.
2. **Purpose**:
   - Use **margin** for spacing **outside the widget**.
   - Use **padding** for spacing **inside the widget**.
3. **Responsive Design**: These methods ensure consistent spacing across devices with different screen sizes and orientations.

### Sizing

| Extension   | Description                                |
|-------------|--------------------------------------------|
| `0.2.rh`    | 20% of the screen height                  |
| `0.1.rw`    | 10% of the screen width                   |
| `0.03.rs`   | 3% of the shortest screen side            |
| `0.03.rl`   | 3% of the  longest screen side            |


---


## Summary Table

| **Feature**            | **Description**                                                                                | **Example Usage**                                                                 |
|------------------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| **`isPortrait`**       | Returns `true` if the screen orientation is in **portrait** mode.                              | `if (ResponsiveMedia.instance.isPortrait) print('Portrait Mode');`                |
| **`isLandscape`**      | Returns `true` if the screen orientation is in **landscape** mode.                             | `if (ResponsiveMedia.instance.isLandscape) print('Landscape Mode');`              |
| **`getResponsiveBox`** | Dynamically returns a value based on the current orientation. Accepts `portraitValue` and `landscapeValue`. | `double size = ResponsiveMedia.instance.getResponsiveBox(100, 200);` |   

---

## 🔍 Comparison with `flutter_screenutil`

| Feature                  | ResponsiveMedia       | flutter_screenutil |
|--------------------------|-----------------------|--------------------|
| Requires Context?        | ✅ Yes                | ✅ Yes             |
| Uses Shortest Side?      | ✅ Yes                | ❌ No              |
| Orientation Support      | ✅ Yes                | ⚠️ Manual          |
| Lightweight              | ✅ Zero dependencies  | ⚠️ Heavier         |
| Padding & Margin Support | ✅ Yes                | ⚠️ Limited         |
| Dynamic Scaling          | ✅ Fully Dynamic      | ⚠️ Partially Fixed |
| Typography Scaling       | ✅ Built-in           | ⚠️ Requires Manual |
| Extensibility            | ✅ Highly Extensible  | ⚠️ Limited         |
| Scaling Behaviors        | ✅ Granular Control   | ⚠️ Generalized     |
| Community Support        | ⚠️ Growing            | ✅ Established     |
| Documentation Quality    | ✅ Detailed           | ✅ Detailed        |
| Ease of Use              | ✅ Beginner-Friendly  | ⚠️ Slightly Complex|

---

### Advanced Breakpoint Methods

| Method | Description |
|--------|-------------|
| `isBreakpoint(name)` | Check if breakpoint is active |
| `largerThan(name)` | Check if screen is larger |
| `smallerThan(name)` | Check if screen is smaller |
| `between(start, end)` | Check if in range |
| `currentBreakpoint` | Get active breakpoint name |
| `valueByDevice({mobile, tablet, desktop})` | Get value by device |
| `valueByBreakpoint({values, default})` | Get value by breakpoint |



---

## 🐛 Troubleshooting

### Issue: "Late variable not initialized"
**Solution**: Make sure you call `ResponsiveMedia.init(context)` before accessing the instance.

### Issue: Custom breakpoints not working
**Solution**: Call `ResponsiveMediaBreakpointConfig.configure()` BEFORE `ResponsiveMedia.init()`.

### Issue: Breakpoint values seem wrong
**Solution**: Check that you're using screen width (not height) for breakpoint comparisons.

---


## 🏗 Planned Features

### 🚧 Version 1.3.0 (Coming Soon)
- `ResponsiveMediaBuilder`: A widget for automatic context injection.
- **Theme-Aware Styles**: Support for light and dark mode text styles.

---

Happy coding with `ResponsiveMedia`! 🎉