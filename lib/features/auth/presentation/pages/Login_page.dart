import 'package:flutter/material.dart';
import 'package:fundraising/core/constants/app_colors.dart';
import 'package:fundraising/features/auth/presentation/widgets/auth_button.dart';
import 'package:fundraising/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Set background color here
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/login.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 20),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 25),
              AuthButton(
                buttonText: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color.fromARGB(255, 19, 19,
                                      19), // Changed for better visibility
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                      ),
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
