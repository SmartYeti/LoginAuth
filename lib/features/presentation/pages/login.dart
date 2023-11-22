import 'package:flutter/material.dart';
import 'package:loginauth_web/core/utils/guard.dart';
import 'package:loginauth_web/features/presentation/pages/forgot.dart';
import 'package:loginauth_web/features/presentation/pages/home.dart';
import 'package:loginauth_web/features/presentation/pages/register.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   titleTextStyle: const TextStyle(
      //     fontSize: 30,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white
      //     ),
      //     title: const Center(child: Text('Login')),
      //     backgroundColor: Colors.black,
      // ),

      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 700,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1), fontSize: 50),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(143, 148, 251, 1)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromRGBO(143, 148, 251, 1)))),
                          child: TextFormField(
                            validator: (String? val) {
                              return Guard.againstInvalidEmail(val, 'Email');
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _emailController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[700])),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (String? val) {
                              return Guard.againstEmptyString(val, 'Password');
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_open),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[700])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))
                      // borderRadius: BorderRadius.circular(10),
                      // gradient: const LinearGradient(colors: [
                      //   Color.fromRGBO(143, 148, 251, 1),
                      //   Color.fromRGBO(143, 148, 251, 6),
                      // ]),
                      ),
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomePage()));
                    if (_formKey.currentState!.validate()) {
                      _login(context);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPage()));
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                ),
                const SizedBox(height: 30, child: Divider()),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    var url = Uri.http('127.0.0.1:8000', 'api/login');
    var response = await http.post(url, body: {
      'email': _emailController.text,
      'password': _passwordController.text
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('fail');
    }
  }
}
