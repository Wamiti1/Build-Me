import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
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
              MaterialPageRoute(builder: (context) => AdminPage()),
            );
          },
          child: Text('Go to Admin Page'),
        ),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Dashboard Section
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DashboardCard(
              title: 'Total Users',
              value: '150',
            ),
            DashboardCard(
              title: 'Active Projects',
              value: '25',
            ),
            SizedBox(height: 20),
            // User Management Section
            Text(
              'User Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('View All Users'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add New User'),
            ),
            SizedBox(height: 20),
            // Content Management Section
            Text(
              'Content Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('View All Posts'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add New Post'),
            ),
            SizedBox(height: 20),
            // Settings Section
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('App Settings'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Security Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;

  DashboardCard({required this.title, required this.value});

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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
