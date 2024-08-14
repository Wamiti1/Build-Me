import 'package:build_me/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool hasid = prefs.containsKey('email'); 
  runApp(MyApp(hasid: hasid,));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key, required this.hasid});
final bool hasid;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? email;

Future getemail() async{
  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email')?? 'Guest';
  setState(() {
    email = email;
  });

  }
  catch(error){
    return Text('Error getting email: ${error.toString()}');
  }
  
  
}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Home(hasid: widget.hasid,),
    );
  }
}





