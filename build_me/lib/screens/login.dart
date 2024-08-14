// lib/login.dart
import 'package:build_me/futures/login.dart';
import 'package:build_me/screens/engineers.dart';
import 'package:build_me/screens/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // String _email = '';
  // String _password = '';

  // Future<void> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();

  //     // You can now use _email and _password to authenticate the user
  //     // For example, send the data to your backend API

  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Logging in...'),
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  else{
                    return null;
                  }
                },
               
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){

                  try{

                  var isValid = _formKey.currentState!.validate();
                  if(isValid){
                    login(email.text, password.text).then((v){
                      if(v == 'Log in successful'){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(v.toString()),
                        ));
                        
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EngineersPage()),);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(v.toString()),
                        ));
                      }
                    });
                  }

                  else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill in all the fields'),
                    ));
                  }

                  }
                  catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                  }

                  
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                ); // Navigate to the sign-up page
                },
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
