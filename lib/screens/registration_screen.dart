import 'package:flutter/material.dart';
import 'package:holistic/providers/registration_provider.dart';
import 'package:holistic/screens/login_screen.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<RegistrationProvider>(
          builder: (context, value, child) => Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFormFieldCustom('Name', false, value.name),
                const SizedBox(height: 20),
                textFormFieldCustom('Email', false, value.email),
                const SizedBox(height: 20),
                textFormFieldCustom('Password', true, value.password),
                const SizedBox(height: 20),
                textFormFieldCustom('Phone', false, value.phone),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var result = await value.isSignUp();
                        if (result[0]) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result[1])));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result[1])));
                        }
                      }
                    },
                    style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40))),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 25),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40))),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 25),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textFormFieldCustom(
    String name, bool isPass, TextEditingController controller) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $name';
      }
      return null;
    },
    controller: controller,
    obscureText: isPass,
    decoration: InputDecoration(
        label: Text(name),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
  );
}
