import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:vchatter/auth/presentation/ui/bloc/auth_bloc.dart';
import 'package:vchatter/auth/presentation/ui/screens/home_screen.dart';
import 'package:vchatter/themes/styles.dart';

import '../../../../helper_functions/navigator.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

late TextEditingController _codeController;

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 20, 39),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoggedInState) {
              Navigator.of(context)
                  .pushReplacement(createRoute(context, const HomeScreen()));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    height: size.height * 0.25,
                    'assets/cookie_logo.svg',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "OTP Verification",
                  style: errorStyle.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Pinput(
                    controller: _codeController,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    autofocus: true,
                    closeKeyboardWhenCompleted: true,
                    keyboardType: TextInputType.number,
                    length: 6,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthVerifyOtpEvent(
                      otpCode: _codeController.text,
                      verificationId: widget.verificationId,
                    ));
                  },
                  child: Container(
                    height: 42,
                    width: 260,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 20,
                          fontFamily: 'product sans',
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
