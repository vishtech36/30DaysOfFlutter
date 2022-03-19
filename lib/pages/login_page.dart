import 'package:demo/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonChanged = false;
  final _formKey = GlobalKey<FormState>();

  void _moveToHome() async {
    print('Button cliked');
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChanged = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.home);

      setState(() {
        buttonChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Form(
            key: _formKey,
            child: Column(children: [
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter username", labelText: "Username"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        }
                        if (value.length < 6) {
                          return "Password length can't be less than 6";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(buttonChanged ? 50 : 8),
                        child: InkWell(
                            onTap: () {
                              _moveToHome();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: buttonChanged ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: buttonChanged
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                            )))
                  ]

                      // ElevatedButton(
                      //     style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, MyRoutes.home);
                      //     },
                      //     child: const Text("Login")),

                      ))
            ])));
  }
}
