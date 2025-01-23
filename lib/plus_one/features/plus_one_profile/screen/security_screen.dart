import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/styles.dart';

class SecurityScreen extends StatefulWidget {
  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  String profileViewOption = 'Public';
  String whoCanContactMe = 'Anyone';

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
        title: Text('Security', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [


          // Profile View Option
          ListTile(
            title: Text('Profile View Option', style: styleExtraBold.copyWith(fontSize: 24, color: AppColors.textBlack),),
          ),
          RadioListTile(
            title: Text('Public'),
            value: 'Public',
            groupValue: profileViewOption,
            onChanged: (value) {
              setState(() {
                profileViewOption = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text('Private'),
            value: 'Private',
            groupValue: profileViewOption,
            onChanged: (value) {
              setState(() {
                profileViewOption = value.toString();
              });
            },
          ),

          // Who Can Contact Me
          ListTile(
            title: Text('Who Can Contact Me', style: styleExtraBold.copyWith(fontSize: 24, color: AppColors.textBlack),),
          ),
          RadioListTile(
            title: Text('Anyone'),
            value: 'Anyone',
            groupValue: whoCanContactMe,
            onChanged: (value) {
              setState(() {
                whoCanContactMe = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text('Verified Users'),
            value: 'Verified Users',
            groupValue: whoCanContactMe,
            onChanged: (value) {
              setState(() {
                whoCanContactMe = value.toString();
              });
            },
          ),

        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
