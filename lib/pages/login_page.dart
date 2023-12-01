import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:product_catalog/pages/home_page.dart';
import 'package:product_catalog/utils/constants.dart';
import 'package:product_catalog/ui/custom_button.dart';
import 'package:product_catalog/ui/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Form(
                key: _loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      height: MediaQuery.of(context).viewInsets.bottom > 0 ? 150 : 300,
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'images/logo.jpeg',
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Email',
                      controller: _userEmailController,
                      validator: (text) {
                        if (text != null && !EmailValidator.validate(text)) {
                          return 'Por favor, a um e-mail válido.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Senha',
                      controller: _userNameController,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.trim() == '') {
                          return 'Por favor, a senha.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Acessar',
                      onPressed: () {
                        if (_loginKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
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
