import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;

  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  void verifyOtp(BuildContext context, String userOtp, WidgetRef ref) {
    ref
        .read(authControllerProvider)
        .verifyOtp(context, verificationId, userOtp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('We have sent an SMS with a code.'),
          SizedBox(
            width: size.width * 0.5,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: '- - - - - -',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 6) {
                  verifyOtp(context, value.trim(), ref);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
