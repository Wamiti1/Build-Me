import 'package:flutter/material.dart';

class EngineersPage extends StatelessWidget {
  const EngineersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Engineers Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Profile Section
            const Text(
              'Engineer Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/02/29/28/53/360_F_229285335_RhEeZCARwIu21vflm31mCrIWiOeZxi6F.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lewis Mbogori',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Android Developer'),
                    Text('Nairobi, Kenya'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Skills Section
            const Text(
              'Skill Set Owned',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10,
              children: <Widget>[
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('JavaScript')),
                Chip(label: Text('React')),
                Chip(label: Text('Node.js')),
              ],
            ),
            const SizedBox(height: 20),
            // Projects Section
            const Text(
              'Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: <Widget>[
                ProjectCard(
                  title: 'Project One',
                  description: 'Description of project.',
                  imageUrl: 'https://media.istockphoto.com/id/524085051/photo/beautiful-exterior-of-new-luxury-home-at-twilight.jpg?s=612x612&w=0&k=20&c=wPqEpJkL22wE3NHSCgdWXq2FC8a-KvSCpP7XRIZHuOU=',
                ),
                ProjectCard(
                  title: 'Project Two',
                  description: 'Description of project.',
                  imageUrl: 'https://media.gettyimages.com/id/173799627/photo/study-of-architectural-form-05.jpg?s=612x612&w=0&k=20&c=rrHldo5akJRAeGjm_5ICkzZrTooEYLcww1BkMeCc7Y0=',
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Contact Section
            const Text(
              'Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Email: mbogorilewis@gmail.com'),
            const Text('GitHub: https://github.com/Lewis-Mbogori'),
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(imageUrl),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(description),
          ],
        ),
      ),
    );
  }
}
