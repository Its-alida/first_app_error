import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class PeriodTrackerScreen extends StatefulWidget {
  const PeriodTrackerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PeriodTrackerScreenState createState() => _PeriodTrackerScreenState();
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  final TextEditingController _cycleController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  DateTime? _nextPeriodDate;

  @override
  void initState() {
    super.initState();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _calculatePeriod() {
    if (_selectedDate != null &&
        _cycleController.text.isNotEmpty &&
        _periodController.text.isNotEmpty) {
      final int cycleLength = int.parse(_cycleController.text);
      // final int periodLength = int.parse(_periodController.text);
      final Duration cycleDuration = Duration(days: cycleLength);
      final DateTime periodStartDate = _selectedDate!;
      final DateTime nextPeriodStartDate = periodStartDate.add(cycleDuration);
      final Duration daysLeft = nextPeriodStartDate.difference(DateTime.now());
      final int daysLeftValue = daysLeft.inDays;

      setState(() {
        _nextPeriodDate = nextPeriodStartDate;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 15),
              child: Text(
                'Next cycle in \n $daysLeftValue days',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.pink,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 223, 223),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Text(
                  'Enter your period details:',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 199, 142, 142)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _cycleController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cycle length ',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 139, 45, 76),
                    ),
                    hintText: 'usually 25-35 days',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 96, 133, 54),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.pink,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cycle length';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _periodController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Period length ',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 139, 45, 76),
                    ),
                    hintText: 'usually 3-7 days',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 96, 133, 54),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  style: const TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter period length';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Last Period Started On :   ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF00AD8F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _selectedDate == null
                              ? ' Select a date '
                              : DateFormat('dd MMM yyyy')
                                  .format(_selectedDate!),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, top: 20),
                      child: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: const Icon(Icons.calendar_today,
                            color: Color.fromARGB(255, 38, 63, 39)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8.0, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedDate == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 15),
                                child: Text(
                                  'You did not select your last period date !',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Okay I will select now ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (_formKey.currentState?.validate() ?? false) {
                        _calculatePeriod();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 72, vertical: 16)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              if (_nextPeriodDate != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 80),
                  child: Text(
                    'Next period on: ${DateFormat('dd MMM yyyy').format(_nextPeriodDate!)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.pink,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthTipsScreen extends StatelessWidget {
  const HealthTipsScreen({super.key});

  void navigateToFood(BuildContext context) {
    Routemaster.of(context).push('/eating');
  }

  void navigateToExercise(BuildContext context) {
    Routemaster.of(context).push('/exercise');
  }

  void navigateToStress(BuildContext context) {
    Routemaster.of(context).push('/stress');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Female Health Tips'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPermanentFactsCard(),
            const SizedBox(height: 16),
            _buildHealthGuideCard(
              title: 'Healthy eating',
              imageUrl: 'assets/images/didiiseatinh.jpg',
              onTap: () => navigateToFood(context),
            ),
            const SizedBox(height: 16),
            _buildHealthGuideCard(
              title: 'Fitness exercises',
              imageUrl: 'assets/images/kasrat.png',
              onTap: () => navigateToExercise(context),
            ),
            const SizedBox(height: 16),
            _buildHealthGuideCard(
              title: 'Stress management',
              imageUrl: 'assets/images/teaing.jpg',
              onTap: () => navigateToStress(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPermanentFactsCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General Advice',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Here are some tips about women health and hygiene that you should always keep in mind:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),
            _buildFactItem(
              '- Drink plenty of water to stay hydrated',
              Icons.local_drink,
            ),
            const SizedBox(height: 16),
            _buildFactItem(
              '- Eat a healthy and balanced diet',
              Icons.food_bank,
            ),
            const SizedBox(height: 16),
            _buildFactItem(
              '- Exercise regularly to maintain good health',
              Icons.fitness_center,
            ),
            const SizedBox(height: 16),
            _buildFactItem(
              '- Manage stress through relaxation techniques',
              Icons.spa,
            ),
            const SizedBox(height: 16),
            _buildFactItem(
              '- Get enough sleep to recharge your body and mind',
              Icons.nightlight_round,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFactItem(String text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.purpleAccent,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHealthGuideCard({
    required String title,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.asset(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
