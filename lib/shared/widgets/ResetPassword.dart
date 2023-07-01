import 'package:animated_login/constants.dart';
import 'package:animated_login/pages/auth_page.dart';
import 'package:animated_login/shared/widgets/ForgotPassword.dart';
import 'package:animated_login/shared/widgets/user_login.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _passwd = ValueNotifier<String>('');
  final _otp = ValueNotifier<String>('');
  final _confirmpasswd = ValueNotifier<String>('');
  final _formKey = GlobalKey<FormState>();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController OtpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _size.width * 0.13,
          ),
          child: Form(
            key :_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Column(
                  children: [
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
                              MaterialPageRoute(builder: (context) => ForgotPassword()),
                            );
                          },
                        ),
                        Text(
                          "Reset Password!",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 7,),
                    Text(
                      "Please fill the details to continue",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: OtpController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "OTP is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enter OTP",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (text) => _otp.value = text,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller : PasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "New Password is required";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "New Password",
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
                    onChanged: (text) => _passwd.value = text,
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: ConfirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password is required";
                      }
                      if (value != PasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Confirm Password",
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
                    onChanged: (text) => _confirmpasswd.value = text,
                  ),
                ),
                SizedBox(height:40),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String password = PasswordController.text;
                    print('Password: $password');
                    final otp = _otp.value;
                    print("OTP : $otp");
                    final passwd = _passwd.value;
                    print("New Password : $passwd");
                    final confirmpasswd = _confirmpasswd.value;
                    print("Confirm Password : $confirmpasswd");
                  }
                },
                  style :ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20), // Set button padding
                    textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black),
                    // Set button font size
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    // Set button border radius
                    primary: Colors.orange,
                    elevation: 4,
                  ),// Set button shadow elevation

                  child:
                  Text(
                    "Submit",
                    style: TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                // const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
