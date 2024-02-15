import 'package:first_app/src/pages/community.dart';
import 'package:first_app/src/pages/user_profile_page.dart';
import 'package:first_app/src/pages/user_insights.dart';
import 'package:first_app/src/pages/streeva.dart';

import 'package:flutter/material.dart';
import 'period_tracking_screen.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 255, 195, 222),
        title: const Text('Vigora connect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(), 
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          _navigateToPage(index);
        },
        indicatorColor: const Color.fromARGB(255, 255, 255, 255),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Colors.pink,
            ),
            label: 'You',
          ),
          NavigationDestination(
            icon: Icon(Icons.track_changes, color: Colors.pink),
            label: 'Period',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.insights_rounded,
              color: Colors.pink,
            ),
            label: 'Insights',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.groups,
              color: Colors.pink,
            ),
            label: 'Community',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.chat,
              color: Colors.pink,
            ),
            label: 'StreevaR',
          ),
         
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (currentPageIndex) {
      case 0:
        return _buildProfileSection(); 
      case 1:
        return const PeriodTrackingScreen();
      case 2:
        return const UserInsightsPage();
      case 3:
        return const CommunityPage();
      case 4:
        return const StreevaPage();
      default:
        return Container(); 
    }
  }

  // Widget _buildProfileSection() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Text(
  //         'Complete your profile',
  //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //       ),
  //       ElevatedButton(
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => const UserProfilePage(), 
  //             ),
  //           );
  //         },
  //         child: const Text('Go to User Profile'),
  //       ),
   
  //     ],
  //   );
  // }
Widget _buildProfileSection() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Complete your profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserProfilePage(),
            ),
          );
        },
        child: const Text('Go to User Profile'),
      ),
    ],
  );
}


  void _navigateToPage(int index) {
    // Implement navigation logic based on the selected index
    // You can use Navigator.push or other navigation methods
  }
}