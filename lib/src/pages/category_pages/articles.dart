import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsOne extends StatelessWidget {
  const CardsOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // information about medical professional who has reviewed the article
            _buildProfileSection(),
            const SizedBox(height: 16),
            // Article Title
            _buildArticleTitle(),
            const SizedBox(height: 16),
            // Article Content
            _buildArticleContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Profile Image
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/1643935726414.jfif'),
        ),
        SizedBox(width: 16),
        // Doctor's Credentials
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Renita White, MD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Obstetrician/Gynecologist | \nDuke University | Ohio State University ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArticleTitle() {
    return const Text(
      'Using Tampons Safely',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _buildArticleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Article content
        const Text(
          'There are a few things to keep in mind to prevent problems while using tampons : ',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),

        Image.asset(
          'assets/insert-tampon.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Text(
          'Image source : https://www.menstrupedia.com/articles/girls/how-tampon ',
          style: TextStyle(
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 16),

        const Column(
          children: [
            Text(
              '- Do not forget to wash your hands before insertion',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'This will help prevent the transfer of bacteria from your hands to the tampon.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- Change your tampon every four to eight hours. ',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Often, because tampons are not always obvious when you use the toilet, you can forget to change them. However, they need to be changed about every four hours and should not be left in for longer than 8 hours. Bacteria can grow on a tampon that is left in for too long, increasing the risk of vaginal or bladder infections, as well as toxic shock syndrome (TSS).',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- Change your tampons after you have a bowel movement',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Bacteria-laden feces can contaminate the string that hangs out of the tampon, exposing you to potential vaginal or urinary tract infections. ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        RichText(
          text: TextSpan(
            text: 'For more information, visit \n',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: '\n1. Safe Tampons Usage ',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse(
                      'https://www.verywellhealth.com/the-tampon-debate-3520698')),
              ),
              TextSpan(
                text: '\n\n2. How to use a tampon  ',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse(
                      'https://www.menstrupedia.com/articles/girls/how-tampon')),
              ),
              TextSpan(
                text: '\n\n3. Linkedin of the medical specialist ',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse(
                      'https://www.linkedin.com/in/renita-white-md-facog-68aa5270/')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
