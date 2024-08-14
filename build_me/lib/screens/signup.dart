// lib/signup.dart
import 'package:build_me/futures/signup.dart';
import 'package:build_me/screens/engineers.dart';
import 'package:build_me/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // String _firstname = '';
  // String _lastname = '';
  // String _email = '';
  // String _password = '';
  // String _phone = '';

  // Future<void> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();

  //     // You can now use _name, _email, and _password to register the user
  //     // For example, send the data to your backend API

  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Signing up...'),
  //     ));
  //   }
  // }




  @override
  Widget build(BuildContext context) {
      String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  String _phone = '';
      final formKey = GlobalKey<FormState>();
    var fname = TextEditingController(text: 'Mary');
    var lname = TextEditingController(text: 'Johnson');
    var email = TextEditingController(text: 'maria@gmail.com');
    var password = TextEditingController(text: 'Hello12#');
    var phone = TextEditingController(text: '0756483213');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: fname,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },

                 
                ),
                TextFormField(
                  controller: lname,
                  decoration: const InputDecoration(labelText: 'Last name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                 
                ),
                TextFormField(
                  controller: password,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  
                ),
                TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                 
                ),
               const  SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    var isValid = formKey.currentState!.validate();
                    try{
        
        
                    if(isValid){
                      signup(fname: fname.text.toString(), lname: lname.text.toString(), email: email.text.toString(), password: password.text.toString(), phone: phone.text.toString()).then((v){
                      if(v == 'User created successfully'){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(v.toString())));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const EngineersPage()),
                        ); // Navigate to the login page
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(v.toString())));  
                      }
                    });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check your fields')));
                    }
                    }
                    catch(e){
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString())));
                    
                    }
                    
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const LoginPage()),
                  ); // Navigate to the login page
                  },
                  child: const Text('Already have an account? Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}