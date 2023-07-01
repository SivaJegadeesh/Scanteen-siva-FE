import 'dart:math';
import 'package:animated_login/constants.dart';
import 'package:animated_login/core/app_colors.dart';
import 'package:animated_login/shared/widgets/user_login.dart';
import 'package:animated_login/shared/widgets/contractor_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool _showContractorLogin = false;
  bool isUserPressed = true;
  bool isContractorPressed = false;
  late AnimationController _animationController;
  late Animation<double> _textRotateAnimation;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _textRotateAnimation =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void showUser() {
    setState(() {
      _showContractorLogin = false;
    });
    isUserPressed = true;
    isContractorPressed = false;
    TextStyle(color: Colors.orange);
    _showContractorLogin
        ? _animationController.forward()
        : _animationController.reverse();
  }

  void showContractor() {
    setState(() {
      _showContractorLogin = true;
    });
    isContractorPressed = true;
    isUserPressed = false;
    _showContractorLogin
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: showUser,
              child: Text(
                'User',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: isUserPressed ? FontWeight.bold : FontWeight.normal,
                    color: isUserPressed ? Colors.orange : Colors.white,

                ),
                textAlign: TextAlign.center,
            ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              ' | ',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: showContractor,
              child: Text(
                'Contractor',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: isContractorPressed ? FontWeight.bold : FontWeight.normal,
                    color: isContractorPressed? Colors.orange: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),

            ],
        ),
      ),
      body:

              AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              // login form
              AnimatedPositioned(
                duration: defaultDuration,
                width: _size.width,
                height: _size.height,
                left: _showContractorLogin ? -_size.width : 0,
                 child: GestureDetector(
                  child: Container(
                    color: AppColors.loginBg,
                    child: const UserLogin(),
                  ),
                ),
              ),
              // sign up button
              AnimatedPositioned(
                duration: defaultDuration,
                height: _size.height,
                width: _size.width,
                left: _showContractorLogin ? 0 : _size.width,
                child: Container(
                  color: AppColors.signupBg,
                  child: const ContractorLogin(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
