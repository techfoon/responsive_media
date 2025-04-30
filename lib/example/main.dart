import 'package:flutter/material.dart';
import 'package:responsive_media/responsive_media.dart';

///ResponsiveExample class
class ResponsiveExample extends StatelessWidget {
  ///ResponsiveExaple
  const ResponsiveExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ResponsiveMedia for the current screen
    /// Initialize ResponsiveMedia
    ResponsiveMedia.init(context);
    final rm = ResponsiveMedia.instance; // Use final instance for convenience

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Media Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display device size category
              Text(
                'Size Category: ${rm.sizeCategory}',
                style: TextStyle(fontSize: rm.h1),
              ),
              SizedBox(height: rm.spacingS),

              // Example of dynamic box sizing based on orientation
              Container(
                width: rm.getResponsiveBox(
                    200, 300), // Portrait: 200, Landscape: 300
                height: rm.getResponsiveBox(
                    100, 150), // Portrait: 100, Landscape: 150
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Responsive Box',
                    style: TextStyle(fontSize: rm.body, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: rm.spacingS),

              // Example of margin and padding utilities
              Container(
                margin: rm.marginAll(5), // added 5% margin from all Side
                padding: rm.paddingAll(5), // added 5% padding from all
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Margin & Padding Example',
                  style: TextStyle(fontSize: rm.body),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
