import 'dart:developer';

import 'package:ecommerce_app/app/components/custom_button.dart';
import 'package:ecommerce_app/app/components/screen_title.dart';
import 'package:ecommerce_app/app/modules/auth/FirebaseServices/auth_service.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signup(context),
   
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const ScreenTitle(
                  title: 'Welcome',
                ),
              const SizedBox(
                height: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'hamza0mlaouhi@gmail.com',
                        hintStyle: const TextStyle(
                            color: Color(0xff6A6A6A),
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        fillColor: const Color(0xffF7F7F9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14))),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF7F7F9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14))),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Sign In',
                onPressed: () async {
                  final user = await _auth.loginUserWithEmailAndPassword(
                      _emailController.text, _passwordController.text);
                  if (user != null) {
                    log("User Logged In");
                    Get.offNamed(Routes.BASE);
                  }
                },
                fontSize: 16.sp,
                radius: 12.r,
                verticalPadding: 12.h,
                hasShadow: true,
                shadowColor: Get.theme.primaryColor,
                shadowOpacity: 0.3,
                shadowBlurRadius: 4,
                shadowSpreadRadius: 0,
              ).animate().fade().slideY(
                    duration: const Duration(milliseconds: 300),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            const TextSpan(
              text: "New User? ",
              style: TextStyle(
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            TextSpan(
                text: "Create Account",
                style: const TextStyle(
                    color: Color(0xff1A1D1E),
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offNamed(Routes.SIGNUP);
                  }),
          ])),
    );
  }
}
