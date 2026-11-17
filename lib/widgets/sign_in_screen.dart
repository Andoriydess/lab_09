import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './sign_up_screen.dart';
import './password_recovery_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введіть email';
    }
    final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Введіть валідний email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введіть пароль (від 6 символів)';
    }
    if (value.length < 6) {
      return 'пароль повинен бути не менше 6 символів';
    }
    return null;
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return const AlertDialog(
            title: Text('Title'),
            content: Text("login success"),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
      child: Form(
      key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(
          child: Image.asset("assets/images/img2.png", height: 192, width: 192,),
          ),
          SizedBox(
            width: 300,
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'email',),
            validator: _validateEmail,
 ),
),
          SizedBox(height: 20,),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'password',),
              validator: _validatePassword,
            ),
          ),
          SizedBox(height: 20,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => { _onLoginPressed() },
              child: const Text("Login"),
            ),
            SizedBox(width:20),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                  (context) => const SignUpScreen() )
                )
              },
              child: const Text("Sing Up"),
            ), // Sing Up
          ],
        ),
          SizedBox(height: 20,),
          TextButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => const PasswordRecoveryScreen() )
              )
            },
            child: const Text('Forgot Password'),
          ),
      ],
      ),
    ),
    ),
      ),
    );
  }
}