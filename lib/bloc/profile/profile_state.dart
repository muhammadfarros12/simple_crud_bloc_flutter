part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileResponseModel profile;
  ProfileLoaded({
    required this.profile,
  });
  
}
class ProfileError extends ProfileState {
  final String message;
  ProfileError({
    required this.message,
  });
}
