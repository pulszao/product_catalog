import 'dart:io';
import 'package:flutter/material.dart';
import 'package:product_catalog/controller/user_controller.dart';
import 'package:product_catalog/ui/standard_bottom_modal.dart';
import 'package:product_catalog/ui/user_profile_image_picker.dart';
import 'package:product_catalog/utils/constants.dart';
import 'package:product_catalog/ui/custom_button.dart';
import 'package:product_catalog/ui/custom_text_field.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userBioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    File? userImage = Provider.of<UserController>(context).getUserImage();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
      child: Scaffold(
        appBar: kBuildAppBar(context, 'Perfil'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const BottomSheetModal(
                        backgroundColor: Color(0xFF757575),
                        maxHeight: 400,
                        body: [
                          UserProfileImagePicker(),
                        ],
                      );
                    },
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD7E0FF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: userImage != null ? FileImage(userImage) : const AssetImage('images/empty_user.png') as ImageProvider?,
                              backgroundColor: const Color(0xFFC0CFFD),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Editar foto',
                              style: kBaseTextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: 'Nome Completo',
                  controller: _userNameController,
                ),
                CustomTextField(
                  hintText: 'Email',
                  controller: _userEmailController,
                ),
                CustomTextField(
                  hintText: 'Biografia (opcional)',
                  controller: _userBioController,
                  maxLines: 6,
                ),
                CustomButton(
                  text: 'Salvar',
                  materialIcon: Icons.save,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF3D4547),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: kBaseTextStyle(),
            ),
            Text(
              description,
              style: kBaseTextStyle(
                fontSize: 11,
                color: const Color(0xFF3D4547),
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
