import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textfield.dart';
import 'package:trackizer/common_widget/secondary_button.dart';
import 'package:trackizer/view/login/sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: media.width * 0.5,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              RoundTextfield(
                  title: "Username or email",
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                  title: "Password",
                  controller: txtPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true),
              Row(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     height: 5,
                  //     margin: const EdgeInsets.symmetric(horizontal: 1),
                  //     decoration: BoxDecoration(
                  //       color: TColor.gray70,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     height: 5,
                  //     margin: const EdgeInsets.symmetric(horizontal: 1),
                  //     decoration: BoxDecoration(
                  //       color: TColor.gray70,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     height: 5,
                  //     margin: const EdgeInsets.symmetric(horizontal: 1),
                  //     decoration: BoxDecoration(
                  //       color: TColor.gray70,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     height: 5,
                  //     margin: const EdgeInsets.symmetric(horizontal: 1),
                  //     decoration: BoxDecoration(
                  //       color: TColor.gray70,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isRemember
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_outlined,
                          size: 20,
                          color: TColor.gray50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Remember me",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: TColor.gray50)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: TColor.gray50)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                title: "Sign in",
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SocialLoginView(),
                  //   ),
                  // );
                },
              ),
              const Spacer(),
              Text("if you don't have a account yet?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                title: "Sign up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
