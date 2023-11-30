import 'package:flutter/material.dart';
import 'package:product_catalog/pages/profile_page.dart';
import 'package:product_catalog/utils/constants.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBuildAppBar(context, 'Menu'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dwight Schrute',
                              style: kBaseTextStyle(fontSize: 20),
                            ),
                            Text(
                              'dwight.schrute@gmail.com',
                              style: kBaseTextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const MenuItem(
                icon: Icons.settings,
                label: 'Configurações',
                description: 'Configurações do Aplicativo',
              ),
              const MenuItem(
                icon: Icons.credit_card,
                label: 'Formas de Pagamento',
                description: 'Minhas formas de pagamento',
              ),
              const MenuItem(
                icon: Icons.question_mark_outlined,
                label: 'Cupons',
                description: 'Cupons de desconto',
              ),
              const MenuItem(
                icon: Icons.favorite,
                label: 'Favoritos',
                description: 'Meus produtos favoritos',
              ),
              const MenuItem(
                icon: Icons.logout,
                label: 'Sair da conta',
                description: 'Sair da minha conta',
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Versão 1.0.0',
                    style: kBaseTextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
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
