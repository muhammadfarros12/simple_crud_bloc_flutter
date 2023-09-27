import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/data/datasources/apidatasource.dart';
import 'package:flutter_auth_bloc/presentation/pages/registration_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register/register_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(ApiDatasource()),
      child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RegistrationPage()),
    );
  }
}
