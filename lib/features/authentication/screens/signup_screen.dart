import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crobros/features/authentication/controllers/signup_controller.dart';
import 'package:crobros/features/authentication/models/user_model.dart';
import 'package:crobros/features/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignUpController _signUpController = SignUpController();

  String _selectedRole = 'Content Creator';
  String _errorMessage = '';

  Future<void> _handleSignUp() async {
    final user = UserModel(
      email: _emailController.text,
      password: _passwordController.text,
    );

    final result = await _signUpController.signUp(user, _selectedRole);

    if (result == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    } else {
      setState(() => _errorMessage = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: [
                  DropdownMenuItem(
                    child: Text('Content Creator'),
                    value: 'Content Creator',
                  ),
                  DropdownMenuItem(
                    child: Text('Publisher/Broker'),
                    value: 'Publisher/Broker',
                  ),
                ],
                onChanged: (value) => setState(() => _selectedRole = value!),
                decoration: InputDecoration(labelText: 'Select Role'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _handleSignUp, child: Text('Sign Up')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Already have an account? Login'),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
