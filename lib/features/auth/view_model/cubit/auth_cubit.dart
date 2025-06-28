import 'package:ecommerce_app/core/services/app_preferences.dart';
import 'package:ecommerce_app/features/auth/view_model/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registration({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();
    final trimmedFullName = fullName.trim();

    if ([
      trimmedEmail,
      trimmedPassword,
      trimmedFullName,
    ].any((e) => e.isEmpty)) {
      emit(AuthError(message: "All fields are required"));
      return;
    }

    emit(AuthLoading());
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: trimmedEmail,
        password: trimmedPassword,
      );

      final user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(trimmedFullName);
        await user.sendEmailVerification();

        await AppPreferences.setUserUid(user.uid);
        await AppPreferences.setUserFullName(trimmedFullName);
        await AppPreferences.setLoggedIn(true);

        emit(AuthSuccess());
      } else {
        emit(AuthError(message: "Failed to create account"));
      }
    } catch (e) {
      emit(AuthError(message: _handleAuthException(e)));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();

    if ([trimmedEmail, trimmedPassword].any((e) => e.isEmpty)) {
      emit(AuthError(message: "Email and password are required"));
      return;
    }

    emit(AuthLoading());
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: trimmedEmail,
        password: trimmedPassword,
      );

      final user = userCredential.user;
      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          emit(AuthError(message: "Email is not verified. Check your inbox."));
          return;
        }

        await AppPreferences.setUserUid(user.uid);
        await AppPreferences.setUserFullName(user.displayName ?? '');
        await AppPreferences.setLoggedIn(true);

        emit(AuthSuccess());
      } else {
        emit(AuthError(message: "Sign in failed"));
      }
    } catch (e) {
      emit(AuthError(message: _handleAuthException(e)));
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await AppPreferences.setLoggedIn(false);
      await AppPreferences.setUserUid(null);
      await AppPreferences.setUserFullName(null);
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(message: "An error occurred during sign out"));
    }
  }

  String _handleAuthException(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'weak-password':
          return "Password is too weak";
        case 'email-already-in-use':
          return "Email is already in use";
        case 'user-not-found':
          return "No account found for this email";
        case 'wrong-password':
          return "Incorrect password";
        case 'user-disabled':
          return "This account is disabled";
        case 'too-many-requests':
          return "Too many attempts. Try again later.";
        case 'operation-not-allowed':
          return "This operation is not allowed";
        case 'invalid-email':
          return "The email address is invalid";
        default:
          return error.message ?? "An unknown error occurred";
      }
    }
    return error.toString();
  }
}
