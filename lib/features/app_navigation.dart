import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:od_photo/features/chat/chat_page.dart';
import 'package:od_photo/features/home/home_page.dart';
import 'package:od_photo/features/new_photo/add_photo_page.dart';
import 'package:od_photo/features/profile/profile_page.dart';
import 'package:od_photo/features/search/search_page.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            buildNavigationDestination(
              'assets/icons/home.svg',
              label: '',
            ),
            buildNavigationDestination(
              'assets/icons/search.svg',
              label: '',
            ),
            buildGradientNavigationDestination(
              'assets/icons/plus.svg',
              label: '',
            ),
            buildNavigationDestination(
              'assets/icons/chat.svg',
              label: '',
            ),
            buildNavigationDestination(
              'assets/icons/person.svg',
              label: '',
            ),
          ].map((destination) => destination.icon).toList(),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  NavigationDestination buildNavigationDestination(
    String assetPath, {
    String label = '',
  }) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        assetPath,
        width: 16,
        height: 16,
      ),
      label: label,
    );
  }

  NavigationDestination buildGradientNavigationDestination(
    String assetPath, {
    String label = '',
    double width = 20,
    double height = 20,
    double borderRadius = 10,
  }) {
    return NavigationDestination(
      icon: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.38, -0.93),
            end: Alignment(0.38, 0.93),
            colors: [Color(0xFFFF00D6), Color(0xFFFF4C00)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            color: Colors.white,
            width: 16,
            height: 16,
          ),
        ),
      ),
      label: label,
    );
  }
}

class NavigationDestination {
  final Widget icon;
  final String label;

  NavigationDestination({
    required this.icon,
    required this.label,
  });
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const SearchPage(),
    const AddPhotoPage(),
    const ChatPage(),
    const ProfilePage()
  ];
}
