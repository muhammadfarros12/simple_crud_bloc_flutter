import 'package:bloc/bloc.dart';
import 'package:flutter/physics.dart';
import 'package:meta/meta.dart';

import 'package:flutter_auth_bloc/data/datasources/auth_datasource.dart';
import 'package:flutter_auth_bloc/data/models/response/profile_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthDatasource authDatasource;
  ProfileBloc(
    this.authDatasource,
  ) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        final result = await authDatasource.getProfile();
        emit(ProfileLoaded(profile: result));
      } catch (e) {
        emit(ProfileError(message: 'netowork problem: ${e.toString()}'));
      }
    });
  }
}
