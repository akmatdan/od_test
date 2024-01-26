import 'package:flutter/material.dart';

import '../../../../components/buttons/back_arrow_button.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        leading: const BackArrowButton(),
      ),
      body: const Center(
        child: Text('This is the Privacy Policy page content.'),
      ),
    );
  }
}
