import 'package:flutter/material.dart';
import 'package:loginauth_web/core/utils/guard.dart';
import 'package:loginauth_web/features/presentation/pages/home.dart';
import 'package:loginauth_web/features/presentation/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

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
                              return Guard.againstEmptyString(val, 'Name');
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _name,
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
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromRGBO(143, 148, 251, 1)))),
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
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (String? val) {
                              return Guard.againstNotMatch(val,
                                  _passwordController.text, 'Confirm password');
                            },
                            controller: _cpasswordController,
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
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
}
