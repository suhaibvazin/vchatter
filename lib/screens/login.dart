import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vchatter/helper_functions/validators.dart';
import 'package:vchatter/screens/register_page.dart';
import 'package:vchatter/widgets/clickable_links.dart';
import 'package:vchatter/widgets/clickable_svg.dart';
import 'package:vchatter/widgets/text_field_entry.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Vchatter',
              style: GoogleFonts.poppins(
                letterSpacing: 1,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/login.png', height: 300),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //email text field
                      const TextFieldEntry(
                          label: 'Email',
                          validator: emailValidator,
                          icon: Icon(Icons.email)),
                      const SizedBox(
                        height: 12,
                      ),
                      //password textfield
                      const TextFieldEntry(
                          label: 'Password',
                          validator: passwordValidator,
                          icon: Icon(Icons.lock)),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //register link
                            ClickableLinks(
                              linkText: 'Register',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ));
                              },
                            ),
                            //forgot password link
                            ClickableLinks(
                              linkText: 'Forgot password?',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      //login button
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (formKey.currentState?.validate() ?? true) {
                            // If the form is valid, display a snackbar or perform any other
                            // desired action, such as submitting the form to a server.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 5, 20, 116),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: const Text("Login"),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            //alternative sign in buttons
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                ClickableSvg(
                  imagePath: 'assets/google.svg',
                  onTap: () {},
                  height: 45,
                ),
                const SizedBox(width: 20),
                ClickableSvg(
                  imagePath: 'assets/twitter.svg',
                  onTap: () {},
                  height: 45,
                ),
                const SizedBox(width: 20),
                ClickableSvg(
                  imagePath: 'assets/facebook.svg',
                  onTap: () {},
                  height: 45,
                ),
                const Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
