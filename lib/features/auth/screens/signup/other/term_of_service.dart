import 'package:flutter/material.dart';

import '../../../../components/buttons/back_arrow_button.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        leading: const BackArrowButton(),
      ),
      body: const Center(
        child: Text('This is the Terms of Service page content.'),
      ),
    );
  }
}
