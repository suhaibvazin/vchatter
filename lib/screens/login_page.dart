import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vchatter/helper_functions/navigator.dart';
import 'package:vchatter/helper_functions/validators.dart';
import 'package:vchatter/screens/register_page.dart';
import 'package:vchatter/themes/styles.dart';
import 'package:vchatter/widgets/text_field_entry.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 20, 39),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Column(children: <Widget>[
              //logo container
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/cookie_logo.svg',
                ),
              ),
              const SizedBox(height: 40),
              //Heading and Sub-heading container
              Container(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome back!',
                        style: TextStyle(
                          fontFamily: 'product sans',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '\n', // Add a line break
                      ),
                      TextSpan(
                        text: " Lets's live in brand new world",
                        style: TextStyle(
                          fontFamily: 'product sans',
                          fontSize: 18,
                          color: Color.fromRGBO(91, 103, 136, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  //password text field
                  TextFieldEntry(
                    controller: _nameController,
                    label: 'Name',
                    icon: const Icon(Icons.person_outline_outlined),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldEntry(
                    controller: _passwordController,
                    label: 'Password',
                    icon: const Icon(Icons.lock_outlined),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  InkWell(
                    onTap: () {
                      List<String?> errors = [
                        nameValidator(_nameController.text),
                        passwordValidator(_passwordController.text),
                      ];

                      if (errors.every((element) => element == null)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                const Color.fromARGB(122, 84, 92, 120),
                            duration: const Duration(seconds: 4),
                            content: Text(
                              'Processesing Please wait!!',
                              style: errorStyle,
                            ),
                          ),
                        );
                      }

                      for (var error in errors) {
                        if (error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  const Color.fromARGB(122, 84, 92, 120),
                              duration: const Duration(milliseconds: 1000),
                              content: Text(
                                error,
                                style: errorStyle,
                              ),
                            ),
                          );
                          HapticFeedback.heavyImpact();
                          break;
                        }
                      }
                    },
                    child: Container(
                      height: 42,
                      width: 280,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'product sans',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 42,
                      width: 280,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 18, 20, 39),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/google.svg',
                              height: 25,
                              width: 25,
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'Connect with Google',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'product sans',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'product sans',
                        color: Color.fromARGB(255, 131, 144, 191),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      text: 'Back to? ',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Signup',
                          style: const TextStyle(
                            fontFamily: 'product sans',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(createRoute(
                                  context, const RegisterPageView()));
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
