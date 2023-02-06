import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your phone number"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Whatsapp will need to verify your phone number'),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: TextButton(
                      onPressed: pickCountry,
                      child: const Text('Pick Country'),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    if(country != null)
                      Text('+${country!.phoneCode}'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width: size.width * 0.7,
                        child: TextField(
                          controller: phoneController,
                          decoration:
                              const InputDecoration(hintText: 'Phone Number'),
                        ))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: SizedBox(
                  width: 90,
                  child: CustomButton(
                    onPressed: () {},
                    text: 'NEXT',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
