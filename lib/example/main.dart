import 'package:flutter/material.dart';
import 'package:responsive_media/responsive_media.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp Class
class MyApp extends StatelessWidget {
  /// Constructor for MyApp with an optional key
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveExampleScreen(),
    );
  }
}

/// It is Example ResponsiveMedia
class ResponsiveExampleScreen extends StatelessWidget {
  /// Constructor for ResponsiveExampleScreen with an optional key
  const ResponsiveExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Initialize ResponsiveMedia
    ResponsiveMedia.init(context);
    final rm = ResponsiveMedia.instance; // Use final instance for convenience

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Media Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(rm.spacingS), // Use spacing for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Orientation-Specific Widget
            rm.isPortrait
                ? Text(
                    'Portrait Mode: Adjusted for vertical layout',
                    style: TextStyle(fontSize: rm.h1), // Use typography
                  )
                : Text(
                    'Landscape Mode: Adjusted for horizontal layout',
                    style: TextStyle(fontSize: rm.h1),
                  ),
            SizedBox(height: rm.spacingM), // Add spacing

            // Responsive Box Example
            Container(
              height: rm.getResponsiveBox(150, 300),
              width: rm.getResponsiveBox(100, 200),
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Responsive Box\n${rm.isPortrait ? "Portrait" : "Landscape"}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: rm.body, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: rm.spacingM),

            // Dynamic Size Example
            Text(
              'Dynamic Size Example',
              style: TextStyle(fontSize: rm.h2),
            ),
            Container(
              height: rm.dynamicSize({
                'XS': 50,
                'S': 100,
                'M': 150,
                'L': 200,
                'XL': 250,
              }),
              width: double.infinity,
              color: Colors.green,
              child: Center(
                child: Text(
                  'This adjusts dynamically based on size category (${rm.sizeCategory})',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: rm.caption, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: rm.spacingL),

            // Typography Showcase
            Text(
              'Typography Examples:',
              style: TextStyle(fontSize: rm.title),
            ),
            Text(
              'This is H1',
              style: TextStyle(fontSize: rm.h1),
            ),
            Text(
              'This is H2',
              style: TextStyle(fontSize: rm.h2),
            ),
            Text(
              'This is Body Text',
              style: TextStyle(fontSize: rm.body),
            ),
            Text(
              'This is Caption',
              style: TextStyle(fontSize: rm.caption),
            ),

            SizedBox(height: rm.spacingL),

            // Debug Info
            Text(
              'Debug Info:',
              style: TextStyle(fontSize: rm.title),
            ),
            Text(
              rm.toString(), // Print debug info from ResponsiveMedia
            ),
          ],
        ),
      ),
    );
  }
}
