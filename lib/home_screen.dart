import 'package:flutter/material.dart';
import 'authentication_screen.dart'; // Screen for HAR authentication
import 'location_tracking_screen.dart'; // Screen for tracking
import 'alerts_screen.dart'; // Screen for alerts

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anti-Theft Car System'),
        centerTitle: true, // Center the title for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch buttons horizontally
          children: [
            _buildCustomButton(
              context: context,
              title: 'HAR-Based Authentication',
              icon: Icons.security,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthenticationScreen()),
                );
              },
            ),
            SizedBox(height: 20.0), // Add spacing between buttons
            _buildCustomButton(
              context: context,
              title: 'Track Car Location',
              icon: Icons.location_on,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationTrackingScreen()),
                );
              },
            ),
            SizedBox(height: 20.0), // Add spacing between buttons
            _buildCustomButton(
              context: context,
              title: 'View Alerts',
              icon: Icons.notifications,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlertsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.teal, // Text and icon color
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        elevation: 5, // Add elevation for a subtle shadow effect
      ),
      icon: Icon(icon, size: 24), // Add an icon to the button
      label: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Style the text
      ),
      onPressed: onPressed,
    );
  }
}
