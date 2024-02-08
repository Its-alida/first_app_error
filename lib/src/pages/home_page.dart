import 'package:first_app/src/pages/community.dart';
import 'package:flutter/material.dart';
import 'period_tracking_screen.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class ExpandableCardData {
  final String title;
  final String content;
  bool isExpanded;

  ExpandableCardData({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  const Color.fromARGB(255, 255, 195, 222),
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
      body: _buildBody(), // Add your main content here
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
            icon: Icon(Icons.track_changes, color: Colors.pink), // Add the icon for period tracking
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
          // Add other destinations as needed
        ],
      ),
    );
  }
 Widget _buildBody() {
  // Sample data for expandable cards
  List<ExpandableCardData> expandableCardData = [
    ExpandableCardData(
      title: 'Card 1',
      content: 'Content for Card 1 goes here.',
    ),
    ExpandableCardData(
      title: 'Card 2',
      content: 'Content for Card 2 goes here.',
    ),
    // Add more cards as needed
  ];

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Your other widgets or content can go here

          // ExpansionPanelList for expandable cards
          ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback: (int index, bool isExpanded) {
              // Implement the logic to toggle expansion
              setState(() {
                expandableCardData[index].isExpanded = !isExpanded;
              });
            },
            children: expandableCardData.map<ExpansionPanel>((ExpandableCardData card) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(card.title),
                  );
                },
                body: ListTile(
                  title: Text(card.content),
                ),
                isExpanded: card.isExpanded,
              );
            }).toList(),
          ),

          // Switch statement for page content based on the current index
          if (currentPageIndex == 0) ...[
            const Center(child: Text('Vigora Connect')),
          ] else if (currentPageIndex == 1) ...[
            const PeriodTrackingScreen(),
          ] else if (currentPageIndex == 3) ...[
            const CommunityPage(),
          ] else ...[
            Container(), // Placeholder
          ],
        ],
      ),
    ),
  );
}


  // Widget _buildBody() {

  //   // Implement your main content here based on the current page index
  //   switch (currentPageIndex) {
  //     case 0:
  //       // Return the home page content
  //       return const Center(child: Text('Vigora Connect'));
  //     case 1:
  //       // Return the period tracking screen content
  //       return const PeriodTrackingScreen();
  //     case 3:
  //       // Return the period tracking screen content
  //       return const CommunityPage();
  //     // Add other cases for additional destinations
  //     default:
  //       return Container(); // Placeholder
  //   }
  // }

  void _navigateToPage(int index) {
    // Implement navigation logic based on the selected index
    // You can use Navigator.push or other navigation methods
  }


}
