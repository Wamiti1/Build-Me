
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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image1.webp', scale: 7.5,),
                      
                      const Text(
                        'Build Me',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
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
                
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: OutlinedButton(onPressed:(){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Genusers()),
                );
                        
                }, child: const Text('General User')),
              ),
              Padding(
                padding: const  EdgeInsets.only(bottom: 30),
                child: OutlinedButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EngineersPage()),
                  );
                        
                }, child: const Text('Engineer')),
              ),
              OutlinedButton(onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminPage()),
                );
              }, child: const Text('Admin'))
                
                
          ],
          
        ),
      ),
    );
  }
}