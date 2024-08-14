import 'dart:convert';
import 'package:http/http.dart' as http;

Future login(String email, String password)async{
  try{
    var url = Uri.parse('http://192.168.249.75:5000/login');
    var headers = {
      'Content-Type': 'application/json'
    };
    var body= jsonEncode({
      'email': email,
      'password': password
    });

    http.Response response = await http.post(url, headers: headers, body: body);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else{
      return null;
    }
  }
  catch(e){
    return null;
  }
}