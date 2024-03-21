import 'package:bloc_sampel/auth_bloc/auth_event.dart';
import 'package:bloc_sampel/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        // emit untuk menangkap state
        emit(AuthLoading());
        await Future.delayed(
            const Duration(seconds: 5)); // dipakai ketika mengakses ip service
        emit(AuthSuccess(name: 'Rakhma'));
      },
    );

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 5));
      emit(AuthInitial());
    });
  }
}
