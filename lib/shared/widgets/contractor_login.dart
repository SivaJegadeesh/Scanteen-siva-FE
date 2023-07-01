import 'dart:convert';

import 'package:animated_login/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DropdownButtonFormField<String>(
          value: dropdownValueNotifier.value,
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
    onChanged: (String? newValue) {
      dropdownValueNotifier.value = dropdownValueNotifier.value == newValue
          ? dropdownValueNotifier.value
          : newValue!;
    },
          items: dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
              child: Container(
              decoration: BoxDecoration(
          ),
                child : Text(value,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                  ),
          );
        }).toList(),
        )
      );
  }
}

class ContractorLogin extends StatelessWidget {
  const ContractorLogin({Key? key}) : super(key: key);


  Future<void> loginUser(
      String contractorCode,
      String contractorPhoneNumber,
      String contractorPassword,
      String college,
      BuildContext context,
      ) async {
    final url = Uri.parse('https://troubled-duck-nightshirt.cyclic.app/api/v1/Contractors/login');
    final body = jsonEncode({
      "contractorCode": contractorCode,
      "contractorPhoneNumber": contractorPhoneNumber,
      "contractorPassword": contractorPassword,
    });

    print(body);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');


    if (response.statusCode == 200) {
      // Store response data in shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', response.body);

      print('Success');

      // Navigate to home page or any desired screen
      //Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Display error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: Text('Failed to login: ${response.statusCode}'),
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
    final _contCode = ValueNotifier<String>('');
    final _phone = ValueNotifier<String>('');
    final _passwd = ValueNotifier<String>('');
    final _college = ValueNotifier<String>('Default');

    bool isPassTapped = false;
    bool isPhoneTapped = false;
    final List<String> dropdownItems;
    final String dropdownValue;
    final Function(String) onChanged;

    //MyDropdown({
      //required this.dropdownItems,
      //required this.dropdownValue,
      //required this.onChanged,
    //});

    return Padding(
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Contractor Code",
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
              onChanged: (text) => _contCode.value = text,
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
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
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: MyDropDown(
                dropdownItems: ['Default', 'MIT'],
                dropdownValueNotifier: _college,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
                onChanged: (text) => _passwd.value = text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 137,
              ),
              child: TextButton(
                onPressed: () {},
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
              height: 50,
            ),
            ElevatedButton(onPressed: () async {
              final concode = _contCode.value;
              print("Contractor Code : $concode");
              final phone = _phone.value;
              print("Phone : $phone");
              final passwd = _passwd.value;
              print("Password : $passwd");
              final drop = _college.value;
              print("Dropdown : $drop");

              await loginUser(concode, phone, passwd, drop, context);
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
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
