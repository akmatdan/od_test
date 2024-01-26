import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:od_photo/features/components/text_fields/custom_text_form_field.dart';

import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/validators/validation.dart';
import '../../../components/buttons/back_arrow_button.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../home/discover.dart';

class SignInNextScreen extends StatefulWidget {
  const SignInNextScreen({super.key});

  @override
  _SignInNextScreenState createState() => _SignInNextScreenState();
}

class _SignInNextScreenState extends State<SignInNextScreen> {
  final TextEditingController nicknameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.spaceBtwItems),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text("Register",
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Email TextFormField
              CustomTextFormField(
                  controller: nicknameController, label: "nickname"),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              Row(
                children: [
                  PrimaryButton(
                    text: 'Sign up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiscoverMainPage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Terms of Service and Privacy Policy
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RichText(
                  text: TextSpan(
                    text: 'By signing up, you agree to Photo’s ',
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/terms_of_service');
                          },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/privacy_policy');
                          },
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
