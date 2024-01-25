import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:od_photo/utils/theme/theme.dart';

import 'features/auth/screens/onboarding/onboarding.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: OnboardingScreen(),
    );
  }
}
