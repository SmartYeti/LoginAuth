import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
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
                        "Home Page",
                        style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            fontSize: 50),
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
                      //  child: const Icon(Icons.home,
                      //  color: Color.fromRGBO(143, 148, 251, 1),)

                      child: const Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.home,
                              color: Color.fromRGBO(143, 148, 251, 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: IconButton(
                             icon: Icon(Icons.power_settings_new_rounded),
                              color: Color.fromRGBO(143, 148, 251, 1),
                              onPressed: () {
                                _logout;
                              },
                            ),
                          ),
                          // IconButton(
                          //   onPressed: _logout,
                          // icon: Icon(Icons.power_settings_new_rounded),
                          // )

                          // Container(
                          //   padding: const EdgeInsets.all(8.0),
                          //   decoration: const BoxDecoration(
                          //       border: Border(
                          //           bottom: BorderSide(
                          //               color: Color.fromRGBO(143, 148, 251, 1)))),
                          //   child: TextFormField(
                          //     // controller: _emailController,
                          //     decoration: InputDecoration(
                          //         prefixIcon: const Icon(Icons.email),
                          //         border: InputBorder.none,
                          //         hintText: "Email",
                          //         hintStyle: TextStyle(color: Colors.grey[700])),
                          //   ),
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: TextFormField(
                          //     // controller: _passwordController,
                          //     obscureText: true,
                          //     decoration: InputDecoration(
                          //         prefixIcon: const Icon(Icons.lock_open),
                          //         border: InputBorder.none,
                          //         hintText: "Password",
                          //         hintStyle: TextStyle(color: Colors.grey[700])),
                          //   ),
                          // )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //       backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10))
                    //       // borderRadius: BorderRadius.circular(10),
                    //       // gradient: const LinearGradient(colors: [
                    //       //   Color.fromRGBO(143, 148, 251, 1),
                    //       //   Color.fromRGBO(143, 148, 251, 6),
                    //       // ]),
                    //       ),
                    //   child: const SizedBox(
                    //     height: 50,
                    //     child: Center(
                    //       child: Text(
                    //         "Login",
                    //         style: TextStyle(
                    //             color: Colors.white, fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    const SizedBox(height: 10),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Text(
                    //     "Forgot Password?",
                    //     style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                    //   ),
                    // ),
                    // const SizedBox(height: 30, child: Divider()),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // TextButton(
                    //   onPressed: () {
                    //   },
                    //   child: const Text(
                    //     "Register",
                    //     style: TextStyle(
                    //       color: Color.fromRGBO(143, 148, 251, 1)
                    //     ),
                    //   ),
                    //  ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _logout(BuildContext context) async {
    var url = Uri.http('127.0.0.1:8000', 'api/loout');
    var response = await http.post(url, body: {});
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
