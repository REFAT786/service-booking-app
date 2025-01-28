import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../plus_one/features/auth/login/controller/loginController.dart';
import '../../plus_one/features/auth/sign_up/controller/sign_up_controller.dart';
import '../../plus_one/features/chat_screen/screen/chat_screen.dart';
import '../../plus_one/features/event_screen/screen/event_screen.dart';
import '../../plus_one/features/explore_screen/screen/explore_screen.dart';
import '../../plus_one/features/home/screen/home_screen.dart';
import '../../plus_one/features/plus_one_profile/profile/screen/profile_screen.dart';
import '../../seekers/features/home/screen/seeker_home_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  CustomBottomNavBar({Key? key}) : super(key: key);

  List<Widget> _buildScreens(String role) {
    return [
      role == "seeker" ?  SeekerHomeScreen() :  HomeScreen(),
       ExploreScreen(),
       EventScreen(),
       ChatScreen(),
       ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Explore",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.event),
        title: "Event",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat),
        title: "Chat",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(controller.role),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style3, // Style 3
      );;
    },);
  }
}
