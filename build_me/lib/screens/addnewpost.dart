import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddPostForm extends StatefulWidget {
  @override
  _AddPostFormState createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';
  String _engineerId = ''; // This would typically be selected from existing engineers

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create the data to send to the API
      final post = {
        'title': _title,
        'content': _content,
        'engineerId': _engineerId,
      };

      // Send the data to the backend API
      final response = await http.post(
        Uri.parse(''), // Adjust the API endpoint accordingly
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post),
      );

      if (response.statusCode == 201) {
        // Post created successfully
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Post added successfully!'),
        ));
        _formKey.currentState!.reset();
      } else {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to add post. Please try again.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
                onSaved: (value) {
                  _content = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Engineer ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the engineer ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _engineerId = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
