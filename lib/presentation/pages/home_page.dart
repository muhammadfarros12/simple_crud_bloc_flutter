import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/bloc/profile/profile_bloc.dart';
import 'package:flutter_auth_bloc/data/localsources/auth_local_storage.dart';
import 'package:flutter_auth_bloc/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),
      actions: [
        IconButton(onPressed: () async{
          await AuthLocalStorage().removeToken();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
        }, icon: const Icon(Icons.logout_outlined))
      ],
      ),
      body: Column(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state){
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.profile.name ?? 'Nama tidak terdaftar'),
                  const SizedBox(width: 8,),
                  Text(state.profile.email ?? 'Email tidak terdaftar'),
                ],
              );
            }
            return const Text('No Data');
          })
        ],
      ),
    );
  }
}