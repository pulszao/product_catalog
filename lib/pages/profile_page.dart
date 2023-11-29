import 'package:flutter/material.dart';
import 'package:product_catalog/constants.dart';
import 'package:product_catalog/ui/custom_button.dart';
import 'package:product_catalog/ui/custom_text_field.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
      child: Scaffold(
        appBar: kBuildAppBar(context, 'Perfil'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Container(
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