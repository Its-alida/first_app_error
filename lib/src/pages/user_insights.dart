import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInsightsPage extends StatelessWidget {
  const UserInsightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 248, 135, 224),
        child: ListView(
          children: [
            _searchBar(),
            const SizedBox(
              height: 20,
            ),
            // cards made using generative AI
            _buildInsightCard(
              'Understand your menstrual cycle',
              'The menstrual cycle, a vital aspect of reproductive health, consists of four phases: menstruation, follicular, ovulation, and luteal. Hormonal changes drive these stages, regulating fertility and overall well-being.',
              'assets/menstrual_cycle.jpg',
            ),
            _buildInsightCard(
              'Sanitary Pads - the right choice for you',
              'Choosing the right sanitary pad is crucial for comfort and protection. Consider flow intensity, pad thickness, and material. Tailor your choice to your unique needs for a confident and stress-free period.',
              'assets/pads.png',
            ),
            _buildInsightCard(
              'Mood Swings',
              'Period mood swings, like a tempest within, stir emotions from euphoria to melancholy. A rollercoaster ride through joy and tears, navigating hormonal tides, until calm returns with the cycle end.',
              'assets/mood.png',
            ),
          ],
        ),
      ),
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 250, 250, 250).withOpacity(1),
            spreadRadius: 0.0,
            blurRadius: 40,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 155, 154, 154),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/search_black_24dp.svg'),
          ),
          suffixIcon: SizedBox(
            width: 120,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Color.fromARGB(211, 51, 51, 51),
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/tune_black_24dp.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildInsightCard(String title, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
