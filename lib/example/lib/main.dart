import 'package:flutter/material.dart';
import 'package:responsive_media/responsive_media.dart';

/// A simple example demonstrating the use of the ResponsiveMedia package.
/// This widget showcases:
/// - Displaying device size category (e.g., XS, S, M, L, XL)
/// - Dynamic box sizing based on orientation (portrait/landscape)
/// - Utility methods for responsive margins and padding
/// - Typography scaling for text sizes
class ResponsiveExample extends StatelessWidget {
  /// Default constructor for the ResponsiveExample widget
  const ResponsiveExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ResponsiveMedia for the current screen
    // This must be called before using any ResponsiveMedia utilities
    ResponsiveMedia.init(context);

    // Get an instance of ResponsiveMedia for convenience
    final rm = ResponsiveMedia.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Media Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the current device size category (XS, S, M, L, XL)
              // This is useful for debugging and understanding device responsiveness
              Text(
                'Size Category: ${rm.sizeCategory}',
                style: TextStyle(
                  fontSize: rm.h1, // Dynamically scaled heading size
                ),
              ),

              // Add spacing between elements
              SizedBox(height: rm.spacingS),

              // Example: A responsive box that adjusts its width and height
              // based on the device's orientation (portrait or landscape)
              Container(
                // Set the width of the container to 40% of the shortest side of the screen
// The shortest side is dynamically calculated based on the screen's dimensions
// (e.g., in portrait mode, the shortest side is the screen width, and in landscape mode, it's the screen height)
                width: rm.shortestSide * 0.4,

// Set the height of the container to 20% of the shortest side of the screen
// This ensures the height is proportionate to the screen size, making the container responsive
                height: rm.shortestSide * 0.2,
                color: Colors.blueAccent, // Background color of the container
                child: Center(
                  child: Text(
                    'Responsive Box',
                    style: TextStyle(
                      fontSize: rm.body, // Dynamically scaled body text size
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),

              // Add spacing between elements
              rm.gapS(),

              // Example: A container demonstrating dynamic margins and padding
              // Margins and paddings are set as percentages of the screen size
              Container(
                margin: rm.marginAll(
                  5, // Adds 5% margin on all sides
                ),
                padding: rm.paddingAll(
                  5, // Adds 5% padding on all sides
                ),
                decoration: BoxDecoration(
                  color:
                      Colors.greenAccent, // Background color of the container
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Text(
                  'Margin & Padding Example',
                  style: TextStyle(
                    fontSize: rm.body, // Dynamically scaled body text size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: ResponsiveExample(), // Set ResponsiveExample as the home widget
    ),
  );
}
