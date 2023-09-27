part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class SaveRegisterEvent extends RegisterEvent {
  final RegisterModel request;
  SaveRegisterEvent({required this.request});
}
