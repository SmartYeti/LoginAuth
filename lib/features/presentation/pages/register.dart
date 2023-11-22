import 'package:flutter/material.dart';
import 'package:loginauth_web/features/presentation/pages/home.dart';
import 'package:loginauth_web/features/presentation/pages/login.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 700,
          height: 700,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                  child: Text(
                    "Register",
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1)))),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.grey[700])),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(8.0),
                      //   decoration: const BoxDecoration(
                      //       border: Border(
                      //           bottom: BorderSide(
                      //               color: Color.fromRGBO(143, 148, 251, 1)))),
                      //   child: TextFormField(
                      //     controller: _emailController,
                      //     decoration: InputDecoration(
                      //         prefixIcon: const Icon(Icons.person_outline),
                      //         border: InputBorder.none,
                      //         hintText: "Last Name",
                      //         hintStyle: TextStyle(color: Colors.grey[700])),
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1)))),
                        child: TextFormField(
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
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1)))),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_open),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[700])),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              border: InputBorder.none,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.grey[700])),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _register(context);
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                ),
                const SizedBox(height: 30, child: Divider()),
                const SizedBox(
                  height: 5,
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text(
                //     "Register",
                //     style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _register(BuildContext context) async {
    var url = Uri.http('127.0.0.1:8000', 'api/register');
    var response = await http.post(url, body: {
      'name': _nameController.text,
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
