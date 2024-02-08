// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'period_tracking_screen.dart';

// class WelcomePage extends StatelessWidget {
//   final String userEmail;

//   const WelcomePage({Key? key, required this.userEmail}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;


//     return Scaffold(
//       backgroundColor: Colors.pink,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             user != null && user.photoURL != null
//                 ? Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: NetworkImage(user.photoURL!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )
//                 : const Placeholder(), // Placeholder for when photoURL is not available

//             const SizedBox(height: 20),

//             // Updated the Text widget for the welcome message
//             const Text(
//               'Welcome',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold, // You can adjust the fontWeight as needed
//               ),
//             ),
            
//             const SizedBox(height: 8),

//             Text(
//               userEmail,
//               textAlign: TextAlign.center, // Center the text
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//             ),
//             ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const PeriodTrackingScreen(),
//                 ),
//               );
//             },
//             child: const Text('Continue to App'),
//           ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Sign Out'),
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signOut();
//                   Navigator.pop(context); // Navigate back to the sign-in page
//                 } catch (e) {
//                   print('Error signing out: $e');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart'; // Import your home page file

class WelcomePage extends StatelessWidget {
  final String userEmail;

  const WelcomePage({Key? key, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user != null && user.photoURL != null
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(user.photoURL!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Placeholder(), // Placeholder for when photoURL is not available

            const SizedBox(height: 20),

            // Updated the Text widget for the welcome message
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold, // You can adjust the fontWeight as needed
              ),
            ),

            const SizedBox(height: 8),

            Text(
              userEmail,
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(), // Navigate to the home page
                  ),
                );
              },
              child: const Text('Continue to App'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Sign Out'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context); // Navigate back to the sign-in page
                } catch (e) {
                  print('Error signing out: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
