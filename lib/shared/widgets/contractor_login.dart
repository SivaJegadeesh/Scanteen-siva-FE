import 'package:animated_login/constants.dart';
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
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DropdownButtonFormField<String>(
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
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: MyDropDown(
                dropdownItems: ['Default', 'MIT'],
                dropdownValue: 'Default',
                onChanged: (String? newValue) {},
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 137,
              ),
              child: TextButton(

                // style: ButtonStyle(
                //   alignment: Alignment.centerRight,
                //   padding: MaterialStateProperty.all<EdgeInsets>(
                //     EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                //   ),
                // ),
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
