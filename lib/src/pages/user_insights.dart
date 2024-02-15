import 'package:flutter/material.dart';

class UserInsightsPage extends StatelessWidget {
  const UserInsightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildInsightCard(String title, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150, // Adjust the height as needed
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
