import 'package:animated_login/constants.dart';
import 'package:animated_login/pages/auth_page.dart';
import 'package:animated_login/shared/widgets/user_login.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  //const MyDropDown({Key? key}) : super(key: key);
  final List<String> dropdownItems;
  final String dropdownValue;
  final void Function(String?) onChanged;

  MyDropDown({
    required this.dropdownItems,
    required this.dropdownValue,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        value: dropdownValue,
        icon: Icon(Icons.expand_more,
        color: Colors.grey),
        iconSize: 20,
        elevation: 16,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        onChanged: onChanged,
        items: dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          );
        }).toList(),
    );
  }
}

class UserSignUp extends StatelessWidget {
  const UserSignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    bool isPassTapped = false;
    bool isPhoneTapped = false;


    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _size.width * 0.13,
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Name",
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
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: MyDropDown(
                  dropdownItems: ['Default', 'MIT'],
                  dropdownValue: 'Default',
                  onChanged: (String? newValue) {},
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  obscureText: true,
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
                          color: Colors.white ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
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
                ),
              ),
              SizedBox(height:40),
              ElevatedButton(onPressed: () {} ,
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
                  "Sign Up",
                  style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    "Already Have An Account?",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/authpage');
                    },
                    child:Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 13,
                        color:Colors.white,

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

             // const Spacer(flex: 2),

            ],
          ),
        ),
      ),
    );
  }
}
