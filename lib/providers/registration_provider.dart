import 'package:flutter/cupertino.dart';
import 'package:holistic/services/api_services.dart';

class RegistrationProvider with ChangeNotifier {
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  Future<List> isSignUp() async {
    var result = await ApiServices.checkSignUp(
        name.text, email.text, password.text, phone.text);
    return result;
  }
}
