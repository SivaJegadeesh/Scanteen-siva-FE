import 'package:animated_login/constants.dart';
import 'package:animated_login/shared/widgets/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:animated_login/shared/widgets/user_signup.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _phone = ValueNotifier<String>('');
    final _passwd = ValueNotifier<String>('');
    final _formKey = GlobalKey<FormState>();
    TextEditingController PhoneController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
      bool isPassTapped = false;
      bool isPhoneTapped = false;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _size.width * 0.13,
        ),
        child: Form(
          key : _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 7,),
                  Text(
                    "Please Sign in to your account",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: PhoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone Number is required";
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Enter a valid Phone Number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Phone Number",
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
                onChanged: (text) => _phone.value = text,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  controller: PasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Password",
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 137,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final phone = _phone.value;
                  print("Phone : $phone");
                  final passwd = _passwd.value;
                  print("Password: $passwd");
                }
              } ,
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
                "Sign In",
                style: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              SizedBox(height:7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              Text(
                "Don't Have An Account?",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
                  TextButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => UserSignUp()),
                       );
                     },
                     child:Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 13,
                        color:Colors.white,

                      ),
                    ),
                  ),
              ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
