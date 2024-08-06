import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Engineers Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EngineersPage()),
            );
          },
          child: Text('Go to Engineers Page'),
        ),
      ),
    );
  }
}

class EngineersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engineers Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Profile Section
            Text(
              'Engineer Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Software Engineer'),
                    Text('San Francisco, CA'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Skills Section
            Text(
              'Skills',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: <Widget>[
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('JavaScript')),
                Chip(label: Text('React')),
                Chip(label: Text('Node.js')),
              ],
            ),
            SizedBox(height: 20),
            // Projects Section
            Text(
              'Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                ProjectCard(
                  title: 'Project One',
                  description: 'Description of project one.',
                  imageUrl: 'https://via.placeholder.com/200',
                ),
                ProjectCard(
                  title: 'Project Two',
                  description: 'Description of project two.',
                  imageUrl: 'https://via.placeholder.com/200',
                ),
              ],
            ),
            SizedBox(height: 20),
            // Contact Section
            Text(
              'Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Email: johndoe@example.com'),
            Text('LinkedIn: linkedin.com/in/johndoe'),
            Text('GitHub: github.com/johndoe'),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  ProjectCard({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(imageUrl),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
          ],
        ),
      ),
    );
  }
}
