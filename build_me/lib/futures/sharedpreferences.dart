import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


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