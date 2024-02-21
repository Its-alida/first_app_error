import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double? bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter the following data',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildTextField('Age', ageController),
              const SizedBox(height: 16),
              _buildTextField('Weight (kg)', weightController),
              const SizedBox(height: 16),
              _buildTextField('Height (cm)', heightController),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 24),
              _buildBMIDisplay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildBMIDisplay() {
    return bmi != null
        ? Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                bmi!.toStringAsFixed(2),
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  void _calculateBMI() {
    double? age = double.tryParse(ageController.text);
    double? weight = double.tryParse(weightController.text);
    double? height = double.tryParse(heightController.text);

    if (age != null && weight != null && height != null) {
      double heightInMeters = height / 100;
      double bmiValue = weight / (heightInMeters * heightInMeters);

      setState(() {
        bmi = bmiValue;
      });
    } else {
      // Handle invalid input
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
                'Please enter valid numbers for age, weight, and height.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
