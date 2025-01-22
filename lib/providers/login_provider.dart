import 'package:flutter/cupertino.dart';
import 'package:holistic/services/api_services.dart';

class LoginProvider with ChangeNotifier {
  var email = TextEditingController();
  var password = TextEditingController();

  Future<List> isSignIn() async {
    var result = await ApiServices.checkSignIn(email.text, password.text);
    return result;
  }
}
