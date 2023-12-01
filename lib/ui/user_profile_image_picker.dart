import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_catalog/controller/user_controller.dart';
import 'package:product_catalog/utils/constants.dart';
import 'package:product_catalog/utils/pick_image.dart';
import 'package:provider/provider.dart';

class UserProfileImagePicker extends StatefulWidget {
  const UserProfileImagePicker({
    super.key,
  });

  @override
  State<UserProfileImagePicker> createState() => _UserProfileImagePickerState();
}

class _UserProfileImagePickerState extends State<UserProfileImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Definir foto de perfil',
            style: kBaseTextStyle(
              fontSize: 20.0,
            ),
          ),
          const Divider(color: Colors.grey),
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey.shade300,
                        child: CircleAvatar(
                          radius: 29.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).colorScheme.primary,
                            size: 35,
                          ),
                        ),
                      ),
                      onTap: () async {
                        File? image = await pickImage(ImageSource.camera);
                        if (!mounted) return;
                        Provider.of<UserController>(context, listen: false).setUserImage(image);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Câmera',
                      style: kBaseTextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.grey.shade300,
                          child: CircleAvatar(
                            radius: 29.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.photo,
                              color: Theme.of(context).colorScheme.primary,
                              size: 35,
                            ),
                          ),
                        ),
                        onTap: () async {
                          File? image = await pickImage(ImageSource.gallery);
                          if (!mounted) return;
                          Provider.of<UserController>(context, listen: false).setUserImage(image);
                          Navigator.pop(context);
                        }),
                    const SizedBox(height: 5.0),
                    Text(
                      'Galeria',
                      style: kBaseTextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
