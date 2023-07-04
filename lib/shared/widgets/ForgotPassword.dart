import 'dart:convert';
import 'dart:io';
import 'package:scanteen/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:scanteen/shared/widgets/ResetPassword.dart';
import 'package:http/http.dart' as http;


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();

  Future<void> sendForgotPasswordRequest(String email) async {
    final url = Uri.parse('http://localhost:6000/api/v1/Contractors/forgotPasswordContractor');
    final body = jsonEncode({
      "email": email,
    });
    print(body);

     final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
     if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPass(email: email)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to send forgot password request: ${response.statusCode}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    bool isPhoneTapped = false;
    bool showOtpBox = false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _size.width * 0.13,
          ),

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Column(
                  children:[
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        IconButton(
                          icon: Icon(
                              Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AuthPage()),
                            );
                          },
                        ),
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),

        ],
                    ),
                    SizedBox(height: 7),
                    Text(
                      "Please enter your Email Id",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: EmailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      if (!isValidEmail(value)) {
                        return "Enter a valid Email";
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                   // onChanged: (text) => _email.value = text,
                  ),
                  ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String email = EmailController.text;
                      print('Valid email: $email');
                      sendForgotPasswordRequest(email);
                    }
                  },
                  style :ElevatedButton.styleFrom(

                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Set button padding
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black),
                    // Set button font size
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    // Set button border radius
                    primary: Colors.orange,
                    elevation: 4,
                  ),// Set button shadow elevation

                  child:
                  Text(
                    "Get OTP",
                    style: TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 7),

                // const Spacer(flex: 2),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
bool isValidEmail(String email) {
  // Implement your email validation logic here
  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$',
  );
  return emailRegex.hasMatch(email);
}