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
          height: 40,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            // home
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 16,
                height: 16,
              ),
              label: '',
            ),

            // search
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 16,
                height: 16,
              ),
              label: '',
            ),

            // plus
            NavigationDestination(
              icon: Container(
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.38, -0.93),
                    end: Alignment(0.38, 0.93),
                    colors: [Color(0xFFFF00D6), Color(0xFFFF4C00)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/plus.svg',
                    color: Colors.white,
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
              label: '',
            ),

            // chat
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/chat.svg',
                width: 16,
                height: 16,
              ),
              label: '',
            ),

            // profile
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/person.svg',
                width: 16,
                height: 16,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
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
