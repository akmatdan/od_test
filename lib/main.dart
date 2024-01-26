import 'package:flutter/material.dart';
import 'package:od_photo/features/auth/screens/signup/other/privacy_policy.dart';
import 'package:od_photo/utils/theme/theme.dart';
import 'features/auth/screens/onboarding/onboarding_screen.dart';
import 'features/auth/screens/signup/other/term_of_service.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnboardingScreen(),
      routes: {
        '/terms_of_service': (context) => const TermsOfServicePage(),
        '/privacy_policy': (context) => const PrivacyPolicy()
      },
    );
  }
}
