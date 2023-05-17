import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vchatter/auth/presentation/ui/screens/login_page.dart';

import '../../../../helper_functions/navigator.dart';
import '../../../../themes/styles.dart';
import '../bloc/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOutState) {
          Navigator.of(context)
              .pushReplacement(createRoute(context, const LoginPageView()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 18, 20, 39),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Home',
                style: errorStyle.copyWith(fontSize: 25, letterSpacing: 5)),
            backgroundColor: const Color.fromARGB(173, 18, 20, 39),
            actions: [
              IconButton.outlined(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthLogOutEvent());
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
        );
      },
    );
  }
}
