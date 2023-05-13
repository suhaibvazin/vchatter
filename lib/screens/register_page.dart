import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vchatter/helper_functions/navigator.dart';
import 'package:vchatter/helper_functions/validators.dart';
import 'package:vchatter/screens/login_page.dart';
import 'package:vchatter/themes/styles.dart';
import 'package:vchatter/widgets/text_field_entry.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
                        text: 'Create an account',
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
                  //name text field
                  TextFieldEntry(
                    controller: _nameController,
                    label: 'Name',
                    icon: const Icon(Icons.person_4_outlined),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //password text field
                  TextFieldEntry(
                    controller: _emailController,
                    label: 'Email',
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFieldEntry(
                    controller: _passwordController,
                    label: 'Password',
                    icon: const Icon(Icons.lock_outlined),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      List<String?> errors = [
                        nameValidator(_nameController.text),
                        emailValidator(_emailController.text),
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
                        'Create account',
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
                      text: 'Already have an account? ',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            fontFamily: 'product sans',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                  createRoute(context, const LoginPageView()));
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
