import 'package:flutter/material.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/buttons/secondary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            const Row(
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
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const ClipOval(
                    child: Image(
                      width: 28,
                      height: 28,
                      image: AssetImage("assets/images/user_image.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pawel Czerwinski',
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text('@pawel_czerwinski',
                            style: Theme.of(context).textTheme.labelLarge),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 22.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SecondaryButton(
              text: 'log in',
              onPressed: () {
                // Handle Register button press
              },
            ),
            const SizedBox(width: 16.0), // Add spacing between buttons
            PrimaryButton(
              text: 'register',
              onPressed: () {
                // Handle Sign In button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
