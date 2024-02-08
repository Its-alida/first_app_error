import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<String> communityGroups = ['WeWomen', 'GrannyGang']; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCommunityPageContent(),
    );
  }

  Widget _buildCommunityPageContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              const Text(
                'Community',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
                const Text(
                  '                                   Create ',
                  style: TextStyle(color: Colors.pink),
                ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.pink,
                ), 

                onPressed: () {
                  // Implement logic to add a new community group
                  _createCommunityGroup();
                },
              ),
              
            ],
          ),

          Image.asset(
                'assets/community.jpg', 
                height: 150,
                width: double.infinity, 
                fit: BoxFit.cover,
              ),
          const SizedBox(height: 50),
          const Text(
                'Other Communities',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          const SizedBox(height: 20),
          _buildCommunityGroups(),
        ],
      ),
    );
  }

  Widget _buildCommunityGroups() {
    return Expanded(
      child: ListView.builder(
        itemCount: communityGroups.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(communityGroups[index]),
            onTap: () {
              // Implement logic to navigate to the selected community group
              _joinCommunityGroup(communityGroups[index]);
            },
          );
        },
      ),
    );
  }

  void _createCommunityGroup() {
    // Implement logic to add a new community group
    // This could involve showing a dialog to get the group name and adding it to the list
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Community Group'),
          content: TextField(
            onChanged: (value) {
              // Handle changes in the text field
            },
            decoration: const InputDecoration(
              hintText: 'Enter group name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement logic to add the new community group
                // You can add the group name to the communityGroups list
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _joinCommunityGroup(String groupName) {
    // Implement logic to join the selected community group
    // This could involve showing a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Join Community Group'),
          content: Text('Do you want to join $groupName?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement logic to join the community group
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Join'),
            ),
          ],
        );
      },
    );
  }
}
