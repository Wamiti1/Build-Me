import 'dart:convert';
import 'package:http/http.dart' as http;

Future signup({required String fname, required String lname, required String email, required String password, required String phone}) async{
 try{
    var url = Uri.parse('http://192.168.249.75:5000/signup');
    var headers = {
      'Content-Type': 'application/json'
    };
    var body= jsonEncode({
      'fname':fname,
      'lname':lname,
      'email': email,
      'password': password,
      'phone':phone,

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