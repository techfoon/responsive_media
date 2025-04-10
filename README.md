

# 📱 Responsive Media

A clean and powerful Flutter utility for building responsive UIs based on screen size and orientation. It helps scale font sizes, paddings, margins, gaps, dimensions, and widgets using intuitive extensions and a central class — `ResponsiveMedia`.

---

## ✨ Features

- 🖥 Works seamlessly across all devices: phones, tablets, landscape mode, and web.
- 🧮 Auto-scales typography and spacing based on the shortest screen side.
- 🔧 Intuitive extensions like `0.02.rh`, `0.05.rw`, `0.04.rs`.
- 🛠 Responsive widgets like `rm.h1Text()`, `rm.gapM()`.
- 📦 Easy to integrate into any Flutter project.
- 🎛 Optional `scale` factor for fine-tuning.
- 🏗 Static initialization via `.init(context)` for easy usage anywhere.

---

## 🚀 Installation

Add the package to your project's `pubspec.yaml`:

```yaml
dependencies:
  responsive_media: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🔧 Basic Usage

### 1. Import the package

```dart
import 'package:responsive_media/responsive_media.dart';
```

### 2. Initialize `ResponsiveMedia`

```dart
@override
Widget build(BuildContext context) {
  ResponsiveMedia.init(context); // Initialize here
  ...
}
```

⚠️ **Make sure to call `ResponsiveMedia.init(context)` inside the build method of the root widget or wrap your `MaterialApp` with a custom builder.**

### 3. Access `ResponsiveMedia` anywhere

```dart
final rm = ResponsiveMedia.instance; // Use after init(context)

Padding(
  padding: rm.defaultPadding,
  child: Text("Welcome!", style: rm.h1Style),
);
```

---

## ✅ Example Implementation to Support `.init(context)`

Below is an example of how you can implement the `.init(context)` pattern in the `ResponsiveMedia` class:

```dart
class ResponsiveMedia {
  static ResponsiveMedia? _instance; // Nullable for safety

  final BuildContext context;
  final double scale;

  late final double _shortestSide;
  late final MediaQueryData _mq;

  ResponsiveMedia._(this.context, {this.scale = 1.0}) {
    _mq = MediaQuery.of(context);
    _shortestSide = _mq.size.shortestSide;
  }

  /// Initialize and store instance
  static void init(BuildContext context, {double scale = 1.0}) {
    _instance = ResponsiveMedia._(context, scale: scale);
  }

  /// Access anywhere after init
  static ResponsiveMedia get instance {
    if (_instance == null) {
      throw Exception('ResponsiveMedia.init(context) must be called first');
    }
    return _instance!;
  }

  double get rs => _shortestSide * scale;

  // Example styles
  TextStyle get h1Style => TextStyle(fontSize: 0.06 * _shortestSide);
  TextStyle get h2Style => TextStyle(fontSize: 0.045 * _shortestSide);
  TextStyle get pStyle => TextStyle(fontSize: 0.035 * _shortestSide);

  // Example padding
  EdgeInsets get defaultPadding => EdgeInsets.all(0.04 * _shortestSide);

  // You can add rs extensions too
}
```

_You can add more styles like `h2Style`, `pStyle`, and others in a similar manner._

### Usage Example

```dart
@override
Widget build(BuildContext context) {
  ResponsiveMedia.init(context); // Initialize here
  final rm = ResponsiveMedia.instance;

  return Padding(
    padding: rm.defaultPadding,
    child: Text("Hello!", style: rm.h1Style),
  );
}
```

---

## 🧩 Examples and Use Cases

### ✅ 1. Responsive Text and Padding

```dart
final rm = ResponsiveMedia.instance;

Text('Welcome!', style: rm.h1Style),
Padding(
  padding: rm.defaultPadding,
  child: Text('This is a responsive description.', style: rm.pStyle),
);
```

### ✅ 2. Responsive Layout with SizedBox and Spacing

```dart
Column(
  children: [
    Text('Step 1', style: rm.h2Style),
    rm.gapS(),
    Text('Enter your info'),
    rm.gapM(),
    Text('Step 2', style: rm.h2Style),
  ],
);
```

### ✅ 3. Extensions: `.rh`, `.rw`, `.rs`

```dart
Container(
  height: 0.3.rh, // 30% of screen height
  width: 0.9.rw,  // 90% of screen width
  padding: EdgeInsets.all(0.02.rs), // 2% of shortest side
  child: Text('Scaled Container'),
);
```

### ✅ 4. Grid Layout Example

```dart
GridView.count(
  crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
  crossAxisSpacing: 0.02.rw,
  mainAxisSpacing: 0.02.rh,
  children: List.generate(6, (i) => Container(
    color: Colors.amber,
    child: Center(child: Text('Item $i')),
  )),
);
```

### ✅ 5. Reusable Card Layout

```dart
Container(
  padding: EdgeInsets.all(0.025.rs),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(0.02.rs),
    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      rm.h2Text('Title'),
      rm.gapS(),
      Text('Details...', style: rm.pStyle),
    ],
  ),
);
```

---

## 🧠 API Summary

### Typography

| Getter              | Description         |
|---------------------|---------------------|
| `h1`                | Large heading       |
| `h2`                | Medium heading      |
| `h3`, `h4`, `h5`, `h6` | Smaller headings    |
| `title`             | Section title       |
| `subtitle`          | Smaller subtitle    |
| `p`                 | Paragraph text      |

### Sizing

| Getter           | Description                  |
|-------------------|------------------------------|
| `small`          | Small button size            |
| `medium`         | Medium padding size          |
| `large`          | Large widget size            |
| `fromHeight(f)`  | Scales by screen height      |
| `fromWidth(f)`   | Scales by screen width       |

### Gaps and Padding

| Getter         | Description             |
|-----------------|-------------------------|
| `gapS`, `gapM` | Spacing widgets         |
| `defaultPadding` | Uniform padding       |
| `marginXS`, `spacingXL`, etc. | Various sizes |

### Extensions

| Extension  | Description                      |
|------------|----------------------------------|
| `0.2.rh`   | 20% of screen height            |
| `0.1.rw`   | 10% of screen width             |
| `0.03.rs`  | 3% of shortest side (consistent UI) |

---

## 🔍 Comparison with `flutter_screenutil`

| Feature                  | ResponsiveMedia       | flutter_screenutil |
|--------------------------|-----------------------|--------------------|
| 🛠 Requires context?      | ✅ Yes (for `.of`)    | ✅ Yes (init)      |
| 📐 Uses shortestSide?     | ✅ Yes               | ❌ No              |
| 📝 TextStyle & Widgets    | ✅ Built-in          | ❌ Manual          |
| 🪄 Custom scale support   | ✅ Yes               | ✅ Yes             |
| 🧩 Easy to use            | ✅ Very simple       | ⚠️ Slightly verbose |
| 🔄 Orientation support    | ✅ Yes               | ⚠️ Manual          |
| 🧱 Spacing & Margin APIs  | ✅ Built-in          | ❌ Manual          |
| 🪶 Lightweight            | ✅ Zero dependencies | ⚠️ Extra dependencies |

---

Happy coding with `ResponsiveMedia`! 🎉#   r e s p o n s i v e _ m e d i a  
 