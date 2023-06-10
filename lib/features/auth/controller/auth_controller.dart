import 'package:flutter/material.dart';
import 'package:whatsapp_ui/features/auth/repository/auth_repository.dart';

class AuthController {
  final AuthRepository authRepository;

  AuthController({
    required this.authRepository,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }
}
