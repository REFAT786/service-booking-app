import 'package:flutter/material.dart';

import '../../../common/widgets/custom_bottom_nav_bar.dart';


class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: Container(),
    );
  }
}
