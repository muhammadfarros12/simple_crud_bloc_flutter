import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/bloc/login/login_bloc.dart';
import 'package:flutter_auth_bloc/bloc/register/register_bloc.dart';
import 'package:flutter_auth_bloc/data/models/request/login_model.dart';
import 'package:flutter_auth_bloc/presentation/pages/home_page.dart';
import 'package:flutter_auth_bloc/presentation/pages/registration_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/localsources/auth_local_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isLogin();
    Future.delayed(Duration(seconds: 2));
    super.initState();
  }

    void isLogin() async {
    final isTokenExist = await AuthLocalStorage().isTokenExist();
    if (isTokenExist) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } 
  }

  @override
  void dispose() {
    super.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'email'),
              controller: emailController,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'password'),
              controller: passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginLoaded) {
                  passwordController!.clear();
                  emailController!.clear();
                  // navigasi
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text('success Login')));
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                    onPressed: () {
                      final requestModel = LoginModel(
                          email: emailController!.text,
                          password: passwordController!.text);

                      context
                          .read<LoginBloc>()
                          .add(DoLoginEvent(loginModel: requestModel));
                    },
                    child: const Text('Login'));
              },
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const RegistrationPage();
                }));
              },
              child: const Text(
                'Belum Punya Akun? Register',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
