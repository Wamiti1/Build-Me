
import 'package:build_me/screens/admin.dart';
import 'package:build_me/screens/engineers.dart';
import 'package:build_me/screens/genusers.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WELCOME TO BUILD ME'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image1.webp', scale: 7.5,),
                      
                      const Text(
                        'Build Me',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        
          const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.center,
                      "Proceed Down Below",),
                  )
                ],

              ),
              
            OutlinedButton(onPressed:(){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GeneralUsersPage()),
            );

            }, child: const Text('General User')),
            OutlinedButton(onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EngineersPage()),
              );

            }, child: const Text('Engineer')),
            OutlinedButton(onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPage()),
              );
            }, child: const Text('Admin'))
              
              
        ],
        
      ),
    );
  }
}