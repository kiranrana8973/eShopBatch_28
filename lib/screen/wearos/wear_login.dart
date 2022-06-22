import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wear/wear.dart';

import '../../repositories/user_repository.dart';

class WearOsLoginScreen extends StatefulWidget {
  const WearOsLoginScreen({Key? key}) : super(key: key);

  @override
  State<WearOsLoginScreen> createState() => _WearOsLoginScreenState();
}

class _WearOsLoginScreenState extends State<WearOsLoginScreen> {
  
  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (isLogin) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/wearOsDashboard');
      } else {
        Fluttertoast.showToast(
            msg: 'Either username or password is incorrect',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.transparent,
            textColor: Colors.black);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error : ${e.toString()}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.transparent,
          textColor: Colors.black);
    }
  }

  final _usernameController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
