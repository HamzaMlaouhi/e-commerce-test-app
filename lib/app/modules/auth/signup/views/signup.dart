import 'dart:developer';

import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_snackbar.dart';
import '../../../../components/screen_title.dart';
import '../../FirebaseServices/auth_service.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _signin(context),
       
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                const ScreenTitle(
                  title: 'Register Account',
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
                    const Text(
                      'Password',
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
                      controller: _passwordController,
                      obscureText: true,
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
                    final user = await _auth.createUserWithEmailAndPasswords(
                        _emailController.text, _passwordController.text);
                    if (user != null) {
                      log("User Created Succesfully");
                      CustomSnackBar.showCustomSnackBar(
                          title: 'Done',
                          message:
                              'your account has been created successfully');
                      Get.offNamed(Routes.LOGIN);
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
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xff0D6EFD),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(14),
                //     ),
                //     minimumSize: const Size(double.infinity, 60),
                //     elevation: 0,
                //   ),
                //   onPressed: () async {
                //     final user = await _auth.createUserWithEmailAndPasswords(
                //         _emailController.text, _passwordController.text);
                //     if (user != null) {
                //       log("User Created Succesfully");
                //       CustomSnackBar.showCustomSnackBar(
                //           title: 'Done',
                //           message:
                //               'your account has been created successfully');
                //       Get.offNamed(Routes.LOGIN);
                //     }
                //   },
                //   child: const Text("Sign Up"),
                // )
              ],
            ),
          ),
        ));
  }
}

Widget _signin(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
            text: "Already Have Account? ",
            style: TextStyle(
                color: Color(0xff6A6A6A),
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
          TextSpan(
              text: "Log In",
              style: const TextStyle(
                  color: Color(0xff1A1D1E),
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                 Get.offNamed(Routes.LOGIN);
                }),
        ])),
  );
}
