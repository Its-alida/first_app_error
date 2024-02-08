import 'package:flutter/material.dart';

class PeriodTrackingScreen extends StatefulWidget {
  const PeriodTrackingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PeriodTrackingScreenState createState() => _PeriodTrackingScreenState();
}

class _PeriodTrackingScreenState extends State<PeriodTrackingScreen> {
  late DateTime selectedDate;
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    // Initialize with the current date
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar to mark the start of the period cycle
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Start Date'),
            ),
            const SizedBox(height: 16.0),
            Text('Selected Date: ${selectedDate.toLocal()}'),

            // Input fields for average period length and cycle length
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Average Period Length',
                hintText: 'Enter average period length (24-38 days)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Average Cycle Length',
                hintText: 'Enter average cycle length (5-7 days)',
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16.0),

            // Button to show prediction
            ElevatedButton(
              onPressed: () => _showPrediction(),
              child: const Text('Show Prediction'),
            ),
          ]
        ),
      ),
    //  bottomNavigationBar: NavigationBar(
        
    //     onDestinationSelected: (int index){
    //       setState(() {
    //         currentPageIndex = index;
    //       });
    //     },
    //     indicatorColor: const Color.fromARGB(255, 255, 255, 255),
    //     selectedIndex: currentPageIndex,
    //     destinations: const <Widget>[
    //       NavigationDestination(
    //         // selectedIcon: Icon(Icons.home),
    //         icon: Icon(
    //           Icons.home_filled,
    //           color: Colors.pink
    //           ), 
    //         label: '',
    //         ),
    //         NavigationDestination(
    //           icon: Badge(child : Icon(Icons.notification_add_sharp,color: Colors.pink)),
    //           label: '',
    //           ),
    //           NavigationDestination(
    //           icon: Badge(
    //             label : Text('2'),
    //             child: Icon(Icons.messenger_sharp,color: Colors.pink),
    //           ),
    //           label: '',
    //           ),
    //           NavigationDestination(
    //             icon: Icon(
    //               Icons.favorite,
    //               color: Colors.pink,
    //             ),  // Replace 'new_icon' with the icon you want to add
    //             label: '',
    // ),
    //     ],
    //   ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
     if (picked != selectedDate) {
       setState(() {
        selectedDate = picked;
      });
     }
  }

  void _showPrediction() {
    // Add logic to calculate and display the prediction based on the input values
    // You can use the selectedDate, average period length, and average cycle length for calculations
    // Display the result using a dialog or another UI element
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Prediction'),
          content: const Text('Next cycle in \n 5  days '),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
