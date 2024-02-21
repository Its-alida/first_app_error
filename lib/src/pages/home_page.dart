import 'package:first_app/src/pages/category_pages/articles.dart';
import 'package:first_app/src/pages/category_pages/menstrual_cycle.dart';
import 'package:first_app/src/pages/community.dart';
import 'package:first_app/src/pages/models/category_models.dart';
import 'package:first_app/src/pages/user_profile_page.dart';
import 'package:first_app/src/pages/user_insights.dart';
import 'package:first_app/src/pages/streeva.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  late List<CategoryModel> categories;
  final String url = "https://www.google.com/maps/search/gynecologists+near+me";

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      // Handle loading or empty state
      return const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: currentPageIndex == 4 ? null : appBarThing(context),
      body: _buildBody(),
      bottomNavigationBar: navigationBar(),
    );
  }

  Widget _buildHorizontalCards() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildHorizontalCard(index);
      },
    );
  }

  Widget _buildHorizontalCard(int index) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(top: 20, left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 182, 216, 243),
      ),
      child: const Center(
        child: Text(
          'More',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }

  NavigationBar navigationBar() {
    return NavigationBar(
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
    );
  }

  AppBar appBarThing(BuildContext context) {
    return AppBar(
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
    );
  }

  Widget _buildBody() {
    switch (currentPageIndex) {
      case 0:
        // return _buildProfileSection();
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // _searchBar(),
          const SizedBox(
            height: 40,
          ),
          categoryLabel(),
          const SizedBox(height: 5),
          categoryListView(),
          const SizedBox(height: 23),
          _buildProfileSectionWithBackground(),
          const SizedBox(height: 6),
          SizedBox(
            height: 100,
            child: _buildHorizontalCards(),
          ),
        ]);

      case 1:
        return const PeriodTrackerScreen();
      case 2:
        return const UserInsightsPage();
      case 3:
        return const CommunityPage();
      case 4:
        return const Chatbot();
      default:
        return Container();
    }
  }

  Widget _buildProfileSectionWithBackground() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 242, 202, 243), // Set the desired background color
          borderRadius:
              BorderRadius.circular(10), // Set border radius if needed
        ),
        padding: const EdgeInsets.only(top: 5, left: 0, right: 3),
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 12),
            logPeriods(),
            const SizedBox(height: 12),
            searchGynac(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Padding searchGynac() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(
              width: 3, color: Color.fromARGB(255, 127, 212, 48))),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 173, 233, 138)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebViewPage(
                  url:
                      "https://www.google.com/maps/search/gynecologists+near+me"),
            ),
          );
        },
        child: const Text(
          '   Search Gynaecs Near You  👩🏻‍⚕️    ',
          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }

  Row logPeriods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Log Your Periods 📅 ➡',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 150, 3, 3)),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(const BorderSide(
                  width: 3, color: Color.fromARGB(255, 212, 48, 48))),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 243, 161, 161)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PeriodTrackerScreen(),
                ),
              );
            },
            child: const Text(
              '📝🖋',
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 20),
              child: Text(
                'Know Your BMI 🔫',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 32, 115, 156)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 35.0, top: 20),
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 218, 238, 248)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfilePage(),
                ),
              );
            },
            child: const Text(
              'Calculate BMI ',
              style:
                  TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToPage(int index) {}

  Padding categoryLabel() {
    return const Padding(
      padding: EdgeInsets.only(top: 0, right: 40, left: 28, bottom: 5),
      child: Column(
        children: [
          Text(
            'Explore ✨ 🔎',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Container categoryListView() {
    return Container(
      height: 200,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryDetailPage(category: categories[index]),
                  ),
                );
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )
                    ]),
              ));
        },
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _navigateToCategoryPage(context));
  }

  Widget _navigateToCategoryPage(BuildContext context) {
    switch (category.name) {
      case 'Tampons':
        return const CardsOne();
      case 'Menstrual cycle':
        return const ExoticPage();
      case 'PCOS':
        return const PCOSPage();
      default:
        throw Exception('Unknown category: ${category.name}');
    }
  }
}

class PCOSPage extends StatelessWidget {
  const PCOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: const Center(
        child: Text('.'),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  const WebViewPage({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Gynecologists'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
