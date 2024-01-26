import 'package:flutter/material.dart';
import 'package:od_photo/features/auth/screens/signup/signin_next_screen.dart';

import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/validators/validation.dart';
import '../../../app_navigation.dart';
import '../../../components/buttons/back_arrow_button.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/text_fields/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                "Log In",
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
                    text: 'log in',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppNavigation(),
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
