import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_ui/models/user.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepository authRepository;

  final ProviderRef ref;
  AuthController({
    required this.ref,
    required this.authRepository,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void verifyOtp(BuildContext context, String verificationid, String userOtp) {
    authRepository.verifyOtp(
        context: context, verificationid: verificationid, userOtp: userOtp);
  }

  void storeDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepository.storeDataToFirebase(
        name: name, profilePic: profilePic, ref: ref, context: context);
  }
}
