import 'package:scanteen/constants.dart';
import 'package:scanteen/pages/auth_page.dart';
import 'package:scanteen/shared/widgets/user_login.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  //const MyDropDown({Key? key}) : super(key: key);
  final List<String> dropdownItems;
  final ValueNotifier<String> dropdownValueNotifier;

  MyDropDown({
    required this.dropdownItems,
    required this.dropdownValueNotifier,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        value: dropdownValueNotifier.value,
        icon: Icon(Icons.expand_more,
        color: Colors.white),
        iconSize: 20,
        elevation: 16,
        dropdownColor: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
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
        onChanged: (String? newValue) {
          dropdownValueNotifier.value = dropdownValueNotifier.value == newValue ? dropdownValueNotifier.value : newValue!;
        },
        items: dropdownItems.map((String value) =>
          DropdownMenuItem<String>(
            value: value,
            child: Text(value,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ).toList(),
    );
  }
}

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final _newName = ValueNotifier<String>('');
  final _phone = ValueNotifier<String>('');
  final _passwd = ValueNotifier<String>('');
  final _dropdown = ValueNotifier<String>('Default');
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    bool isPassTapped = false;
    bool isPhoneTapped = false;


    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
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
                    //controller: _newName,
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
                    onChanged: (text) => _newName.value = text,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: MyDropDown(
                      dropdownItems: ['Default', 'MIT'],
                      dropdownValueNotifier: _dropdown,
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      obscureText: false,
                      //controller: _phone,
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
                      onChanged: (text) => _phone.value = text,
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      //controller: _passwd,
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
                  SizedBox(height:40),
                  ElevatedButton(onPressed: () {
                    final name = _newName.value;
                    print("Name : $name");
                    final phone = _phone.value;
                    print("Phone : $phone");
                    final passwd = _passwd.value;
                    print("Password : $passwd");
                    final drop = _dropdown.value;
                    print("Dropdown : $drop");
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => AuthPage()),
                          );
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
      ),
    );
  }
}
