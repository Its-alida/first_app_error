import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String selectedImagePath;
  late bool textOption1Checked = true; 
  late bool textOption2Checked = true;

  @override
  void initState() {
    super.initState();
    selectedImagePath = 'assets/splash_image.png';
    textOption1Checked = true;
    textOption2Checked = true;
  }

  Future<void> _pickImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    

    if (pickedFile != null) {
      setState(() {
        selectedImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 255, 195, 222),
        title: const Text('Settings'),
      ),
      body:
       Padding(
         padding: const EdgeInsets.fromLTRB(20.0, 80.0, 40.0, 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
              children: [
              GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(selectedImagePath),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Profile Photo',
              style: TextStyle(fontSize: 22),
            ),
            ],
            ),
            ),
            
            const SizedBox(height: 20),
            const Text(
              'Other Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                ),
            ),
            Row(
              children: [
                const Text(
                  'Enable period log reminders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Checkbox(
                  value: textOption1Checked,
                  activeColor: Colors.green,
                  onChanged: (bool? value) {
                    setState(() {
                      textOption1Checked = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Enable discovery ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                Checkbox(
                  value: textOption2Checked,
                  activeColor: Colors.green,
                  onChanged: (bool? value) {
                    setState(() {
                      textOption2Checked = value ?? false;
                    });
                  },
                ),
              ],
            ),
            
             const Padding(
              padding: EdgeInsets.only(left: 10.0), 
              child: Text(
                'Disabling this will stop others from seeing you in matching searches',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 109, 108, 108)),
              ),
            ),
           
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 250, 250), // Set the background color here
    );
  }
}
