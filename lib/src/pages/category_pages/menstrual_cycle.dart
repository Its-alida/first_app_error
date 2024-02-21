import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class ExoticPage extends StatelessWidget {
  const ExoticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            const SizedBox(height: 16),
            _buildArticleTitle(),
            const SizedBox(height: 16),
            _buildArticleContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reviwed by Doctors of ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            RichText(
              text: TextSpan(
                text: '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'Cleveland Clinic',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(
                            'https://my.clevelandclinic.org/health/articles/10132-menstrual-cycle'));
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArticleTitle() {
    return const Text(
      'Menstrual Cycle',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget _buildArticleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Menstruation is driven by hormones. Hormones are chemical messengers in your body. Your pituitary gland (in your brain) and your ovaries (part of your reproductive system) make and release certain hormones at certain times during your menstrual cycle.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          'assets/female-repro.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Text(
          ' Image Source : https://my.clevelandclinic.org/health/articles/10132-menstrual-cycle',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'These hormones cause the lining of your uterus to thicken. This happens so that if a pregnancy would occur, an egg can implant into your uterine lining. Hormones also cause your ovaries to release an egg (ovulation). The egg moves down your fallopian tubes, where it waits for sperm. If a sperm does not fertilize that egg, pregnancy does not occur. The lining of your uterus breaks down and sheds. This is your period.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const Text(
          '\nHow long is a normal menstrual cycle?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const Text(
          'The average length of a menstrual cycle is 28 days. However, a cycle can range in length from 21 days to about 35 days and still be normal.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const Text(
          '\nPhases of the menstrual cycle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Image.asset(
              'assets/pysiology-menstrual-phases.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Text(
              'Image Source : https://www.menstrupedia.com/articles/girls/cycle-phases ',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'The specific events that occur during your menstrual cycle are:',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const Column(
          children: [
            Text(
              '- The menses phase:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'This phase begins on the first day of your period. It is when the lining of your uterus sheds through your vagina if pregnancy has not occurred. Most people bleed for three to five days, but a period lasting only three days to as many as seven days is usually not a cause for worry.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Image.asset(
              'assets/pysiology-menstrual-first-phase.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Text(
              'Image Source : https://www.menstrupedia.com/articles/girls/cycle-phases ',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Column(
          children: [
            Text(
              '- The follicular phase:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'This phase begins on the day you get your period and ends at ovulation (it overlaps with the menses phase and ends when you ovulate). During this time, the level of the hormone estrogen rises, which causes the lining of your uterus (the endometrium) to grow and thicken. In addition, another hormone — follicle-stimulating hormone (FSH) — causes follicles in your ovaries to grow. During days 10 to 14, one of the developing follicles will form a fully mature egg (ovum).',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/pysiology-menstrual-follicular-phase.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Text(
              'Image Source : https://www.menstrupedia.com/articles/girls/cycle-phases ',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Column(
          children: [
            Text(
              '- The Ovulation phase:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'This phase occurs roughly at about day 14 in a 28-day menstrual cycle. A sudden increase in another hormone — luteinizing hormone (LH) — causes your ovary to release its egg. This event is ovulation.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/pysiology-menstrual-ovulation-phase.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Text(
              'Image Source : https://www.menstrupedia.com/articles/girls/cycle-phases ',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Column(
          children: [
            Text(
              '- The Luteal phase:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'This phase lasts from about day 15 to day 28. Your egg leaves your ovary and begins to travel through your fallopian tubes to your uterus. The level of the hormone progesterone rises to help prepare your uterine lining for pregnancy. If the egg becomes fertilized by sperm and attaches itself to your uterine wall (implantation), you become pregnant. If pregnancy doesn’t occur, estrogen and progesterone levels drop and the thick lining of your uterus sheds during your period.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/pysiology-menstrual-luteal-phase.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Text(
              'Image Source : https://www.menstrupedia.com/articles/girls/cycle-phases ',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: 'For more information, visit \n',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text:
                    '1 . https://www.menstrupedia.com/articles/girls/cycle-phases',
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(
                        'https://www.menstrupedia.com/articles/girls/cycle-phases'));
                  },
              ),
              TextSpan(
                text:
                    '\n\n2 . https://my.clevelandclinic.org/health/articles/10132-menstrual-cycle',
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(
                        'https://my.clevelandclinic.org/health/articles/10132-menstrual-cycle'));
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
