import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/pages/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme : ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// class Navigation extends StatefulWidget {
//   const Navigation({super.key});

//   @override
//   State<Navigation> createState() => _NavigationState();
// }

// class _NavigationState extends State<Navigation> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context){
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index){
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         indicatorColor: Colors.amber,
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined), 
//             label: 'Home',
//             ),
//             NavigationDestination(
//               icon: Badge(child : Icon(Icons.notification_add_sharp)),
//               label: 'Notifications',
//               ),
//               NavigationDestination(
//               icon: Badge(
//                 label : Text('2'),
//                 child: Icon(Icons.messenger_sharp),
//               ),
//               label: 'Messages',
//               )
//         ],
//       ),
      
//     );

//   }
// }
