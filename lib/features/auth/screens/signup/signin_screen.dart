import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/validators/validation.dart';
import '../../../components/buttons/back_arrow_button.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/text_fields/custom_text_form_field.dart';
import 'signin_next_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              // Email TextFormField
              CustomTextFormField(
                controller: emailController,
                label: 'Email',
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Password TextFormField
              CustomTextFormField(
                controller: passwordController,
                label: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              Row(
                children: [
                  PrimaryButton(
                    text: 'Next',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInNextScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
