import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';

class UserInformationScreen extends StatefulWidget {
  static const String routeName = '/user-information-screen';
  UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController messageController = TextEditingController();
  File? _image;

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  void selectImage() async {
    final image = await pickImageFromGallery(context);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          Stack(
            children: [
              _image == null
                  ? const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flaiacc.com%2Fwp-content%2Fuploads%2F2019%2F03%2Fblank-profile-picture-973460_1280-1030x1030.png&f=1&nofb=1&ipt=1b8ee8f30e05017f8414673d5c61b7a1647e9e662ad8c05b3a7e79b1ef7c8fc2&ipo=images'),
                      radius: 64,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!),
                      radius: 64,
                    ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.85,
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.done))
            ],
          )
        ],
      ),
    )));
  }
}
