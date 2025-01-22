import 'package:flutter/material.dart';
import 'package:holistic/providers/login_provider.dart';
import 'package:holistic/screens/login_screen.dart';
import 'package:holistic/screens/news_app_screen.dart';
import 'package:holistic/screens/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                child: Icon(Icons.person, size: 100),
              ),
              const SizedBox(height: 50),
              textFormFieldCustom(
                'Email',
                false,
                provider.email,
              ),
              const SizedBox(height: 20),
              textFormFieldCustom('Password', true, provider.password),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var result = await provider.isSignIn();
                      if (result[0]) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result[1])));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsAppScreen()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result[1])));
                      }
                    }
                  },
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40))),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ));
                  },
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40))),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
