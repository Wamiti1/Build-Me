import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddUserForm extends StatefulWidget {
  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _profilePicture = '';

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create the data to send to the API
      final user = {
        'name': _name,
        'email': _email,
        'profilePicture': _profilePicture,
      };

      // Send the data to the backend API
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/users'), // Adjust the API endpoint accordingly
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user),
      );

      if (response.statusCode == 201) {
        // User created successfully
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User added successfully!'),
        ));
        _formKey.currentState!.reset();
      } else {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to add user. Please try again.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Profile Picture URL'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a profile picture URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  _profilePicture = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
