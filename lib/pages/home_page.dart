import 'package:flutter/material.dart';
import 'package:product_catalog/constants.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 1;
  PageController _myPage = PageController(initialPage: 0);
  DateTime currentBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 60.0,
        automaticallyImplyLeading: false,
        backgroundColor: kColorScheme.background,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu),
            Text('Produtos'),
            Icon(Icons.account_circle),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kColorScheme.background,
        currentIndex: _currentPage,
        selectedItemColor: kColorScheme.onSurface,
        onTap: (index) {},
        items: [
          buildBottomNavigationBarItem(
            showBadge: false,
            itemIndex: 0,
            pageIndex: _currentPage,
            label: 'Tela Inicial',
            selectedIcon: Icons.home,
            unselectedIcon: Icons.home_outlined,
          ),
          buildBottomNavigationBarItem(
            showBadge: false,
            itemIndex: 1,
            pageIndex: _currentPage,
            label: 'Produtos',
            selectedIcon: Icons.receipt,
            unselectedIcon: Icons.receipt_outlined,
          ),
          buildBottomNavigationBarItem(
            showBadge: true,
            itemIndex: 2,
            pageIndex: _currentPage,
            label: 'Notificações',
            selectedIcon: Icons.notifications,
            unselectedIcon: Icons.notifications_outlined,
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          DateTime now = DateTime.now();
          if (now.difference(currentBackPressTime) > const Duration(seconds: 1)) {
            currentBackPressTime = now;
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: PageView(
          controller: _myPage,
          onPageChanged: (page) {
            // print('Page Changes to index $page');
          },
          physics: const NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
          children: const <Widget>[
            ProductsPage(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required bool showBadge,
    required int pageIndex,
    required int itemIndex,
    required String label,
    required IconData selectedIcon,
    required IconData unselectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 3, end: 6),
        showBadge: showBadge,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: pageIndex == itemIndex ? kColorScheme.primary : kColorScheme.background,
          ),
          child: Icon(
            pageIndex == itemIndex ? selectedIcon : unselectedIcon,
            color: pageIndex == itemIndex ? kColorScheme.background : kColorScheme.onSurface,
          ),
        ),
      ),
      label: label,
    );
  }
}
