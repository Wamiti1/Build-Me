
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
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
          ),
          const Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.center,
                      "Proceed Down Below",),
                  )
                ],

              )),
              
            OutlinedButton(onPressed:(){}, child: const Text('General User')),
            OutlinedButton(onPressed:(){}, child: const Text('Engineer')),
            OutlinedButton(onPressed:(){}, child: const Text('Admin'))
              
              
        ],
        
      ),
    );
  }
}