import 'package:flutter/material.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/buttons/secondary_button.dart';
import '../signup/signin_screen.dart';
import '../singin/signin.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OnboardingBody(),
      bottomNavigationBar: OnboardingBottomNavigation(
        signInPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          );
        },
        signUpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
          );
        },
      ),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/onboarding.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          OnboardingLogo(),
          Spacer(),
          OnboardingUserInfo(),
        ],
      ),
    );
  }
}

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            width: 200,
            height: 50,
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
      ],
    );
  }
}

class OnboardingUserInfo extends StatelessWidget {
  const OnboardingUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          UserInfo(
            imagePath: "assets/images/user_image.jpeg",
            displayName: 'Pawel Czerwinski',
            username: '@pawel_czerwinski',
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String imagePath;
  final String displayName;
  final String username;

  const UserInfo({
    Key? key,
    required this.imagePath,
    required this.displayName,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image(
            width: 28,
            height: 28,
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(displayName, style: Theme.of(context).textTheme.bodyLarge),
            Text(username, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ],
    );
  }
}

class OnboardingBottomNavigation extends StatelessWidget {
  final VoidCallback signInPressed;
  final VoidCallback signUpPressed;

  const OnboardingBottomNavigation(
      {Key? key, required this.signInPressed, required this.signUpPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 22.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryButton(
            text: 'log in',
            onPressed: signInPressed,
          ),
          const SizedBox(width: 16.0),
          PrimaryButton(
            text: 'register',
            onPressed: signUpPressed,
          ),
        ],
      ),
    );
  }
}
