import 'package:demoproject/widget/customTextfield.dart';
import 'package:flutter/material.dart';

import 'firebase/firestore_service.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirestoreService _firestoreService = FirestoreService();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  Color appThemeColor = Colors.brown;

  void updateThemeColor(Color color) {
    setState(() {
      appThemeColor = color;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    countryController.dispose();
    super.dispose();
  }

  void _sendData() async {
    String name = nameController.text;
    String mobile = mobileController.text;
    String email = emailController.text;
    String country = countryController.text;

    try {
      await _firestoreService.sendDataToFirestore(
        name: name,
        mobile: mobile,
        email: email,
        country: country,
      );

      // Show a success message (optional)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Data sent to Firestore.'),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(appThemeColor)
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      // Clear the text fields after data is sent
      nameController.clear();
      mobileController.clear();
      emailController.clear();
      countryController.clear();
    } catch (e) {
      // Show an error message if data cannot be sent
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to send data.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
      appBar: AppBar(
        backgroundColor: appThemeColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
              hint: 'enter your name',
              label: 'name',
              controller: nameController,
              updateThemeColor: updateThemeColor,
            ),
            CustomField(
              hint: 'enter your mobile number',
              label: 'mobile',
              controller: mobileController,
              updateThemeColor: updateThemeColor,
            ),
            CustomField(
              hint: 'example@gmail.com',
              label: 'email',
              controller: emailController,
              updateThemeColor: updateThemeColor,
            ),
            CustomField(
              hint: 'country name',
              label: 'country',
              controller: countryController,
              updateThemeColor: updateThemeColor,
            ),
            ElevatedButton(
              onPressed: _sendData,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(appThemeColor)
              ),
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}


