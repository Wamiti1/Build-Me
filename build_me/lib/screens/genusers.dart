import 'package:build_me/screens/login.dart';
import 'package:build_me/screens/signup.dart';
import 'package:flutter/material.dart';

class Genusers extends StatelessWidget {
  const Genusers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Users Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Introduction Section
            const Text(
              'Welcome to Our App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Engineers often face challenges in showcasing their work to the public. Traditional methods such as physical portfolios, personal websites, and professional networking platforms can be limiting in terms of reach, accessibility, and ease of use. This creates a gap where engineers struggle to effectively present their projects, innovations, and achievements to potential employers, clients, and peers.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Features Section
            const Text(
              'Features',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Engineer Profiles'),
              subtitle: Text('Discover profiles of talented engineers.'),
            ),
            const ListTile(
              leading: Icon(Icons.work),
              title: Text('Projects'),
              subtitle: Text('Explore projects created by engineers.'),
            ),
            const ListTile(
              leading: Icon(Icons.article),
              title: Text('Articles & Resources'),
              subtitle: Text('Read articles and access resources related to engineering.'),
            ),
            const SizedBox(height: 20),
            // Resources Section
            const Text(
              'Resources',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ResourceCard(
              title: 'Getting Started Guide',
              description: 'Learn how to use our app and get the most out of it.',
              url: 'https://example.com/getting-started',
            ),
            ResourceCard(
              title: 'Engineering Tutorials',
              description: 'Access a wide range of tutorials on various engineering topics.',
              url: 'https://example.com/tutorials',
            ),
            const SizedBox(height: 20),
            // Contact Section
            const Text(
              'Contact Us For More at',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Email: supportbuildme@gmail.com'),
            const Text('Phone: 0792322047'),
            const Text('Address: P.O. Box 333-00000'),

            TextButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // Navigate to the login page
                },
                child: const Text('Already have an account? Log in'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                ); // Navigate to the login page
                },
                child: const Text("Don't Have an account? Sign Up Here"),
              ),
          ],
        ),
      ),
      
    );
  }
}

class ResourceCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  ResourceCard({required this.title, required this.description, required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Open URL
                // Here, you can use the url_launcher package to open the URL
                // Example:
                // launch(url);
              },
              child: Text('Learn More', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
  
