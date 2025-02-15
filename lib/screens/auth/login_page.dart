import 'package:flutter/material.dart';
import 'package:library_management_sys/resource/routes_name.dart';
import 'package:library_management_sys/screens/student_nav.dart';
import 'package:library_management_sys/widgets/form_widget/custom_button.dart';
import 'package:library_management_sys/widgets/form_widget/custom_label_password.dart';
import '../../resource/colors.dart';
import '../../widgets/custom_banner/custom_banner.dart';
import '../../widgets/form_widget/custom_label_textfield.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final String text1 = "Sign in";
  final String text2 = "Sign in to your account";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomBanner(text1: text1, text2: text2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
                  child: Column(
                    children: [
                      CustomLabelTextfield(hintText: "StudentID", outlinedColor: Colors.black, focusedColor: AppColors.primary, width: size.width, text: "StudentID"),
                    const SizedBox(height: 16,),
                      PasswordTextfield(obscureText: true,hintText: "Password", outlinedColor: Colors.black, focusedColor: AppColors.primary, width: size.width, text: "Password"),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                      secondaryAnimation) =>
                                  const StudentNavBar(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                    animation.drive(tween);
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      CustomButton(buttonColor:AppColors.primary,text: 'Login', onPressed: () {  },)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}