import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/views/plus_one_profile/profile/screen/profile_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? selectedLanguage = 'English (US)';
  final Map<String, List<String>> languages = {
    'Suggested': ['English (US)', 'English (UK)'],
    'Other Languages': [
      'Spanish',
      'French',
      'German',
      'Italian',
      'Japanese',
      'Chinese',
      'Russian',
      'Arabic',
      'Portuguese',
      'Korean',
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Language', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ...languages.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                ...entry.value.map((language) {
                  return ListTile(
                    title: Text(language),
                    trailing: Radio<String>(
                      value: language,
                      groupValue: selectedLanguage,
                      onChanged: (String? value) {
                        setState(() {
                          selectedLanguage = value;
                          Get.to(ProfileScreen());
                        });
                      },
                    ),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}
