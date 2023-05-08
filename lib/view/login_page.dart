
import 'dart:convert';
import 'package:comix_project_master/view/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/teststyle.dart';
import 'let_us_know.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.34:5000/api/v1/pic/admin/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {"content-type": "application/json"},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('success');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('Registration Page')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/avengers.png')),
                ),
              ),
              Container(
                // height: 500,
                // color: Colors.red,

                // decoration:BoxDecoration(gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [Colors.black,Colors.white,Colors.black])),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black))
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.white,
                              labelText: 'Password',
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: width,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.red.shade800),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login(
                                    _usernameController.text.toString(),
                                    _passwordController.text.toString(),
                                  );
                                }
                              },
                              child: Text('Login',style: white_b_v,),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have account!",style: black_iii,),
                            TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrPage(),));
                            }, child: Text('Register',style: red_b_iv,))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
