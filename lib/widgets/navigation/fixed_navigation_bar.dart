import 'package:blur_bottom_bar/blur_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naurs/screens/account/account.dart';
import 'package:naurs/screens/authentication/register/register.dart';
import 'package:naurs/screens/authentication/selector.dart';
import 'package:naurs/screens/buy/buy.dart';
import 'package:naurs/screens/home/home.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/navigation/route.dart';

class FixedNavigationBar extends StatefulWidget {
  const FixedNavigationBar({Key? key, required this.selectedPage})
      : super(key: key);
  final int selectedPage;

  @override
  State<FixedNavigationBar> createState() => _FixedNavigationBarState();
}

class _FixedNavigationBarState extends State<FixedNavigationBar> {
  List navigationBarItemList = [
    const BottomNavigationBarItem(
      label: "Home",
      tooltip: "Home",
      icon: Icon(FontAwesomeIcons.house, size: 20),
    ),
    const BottomNavigationBarItem(
      label: "Buy",
      tooltip: "Buy",
      icon: Icon(FontAwesomeIcons.cartShopping, size: 20),
    ),
    const BottomNavigationBarItem(
      label: "Book",
      tooltip: "Book",
      icon: Icon(FontAwesomeIcons.calendarDays, size: 20),
    ),
    const BottomNavigationBarItem(
      label: "1-On-1",
      tooltip: "One On One",
      icon: Icon(FontAwesomeIcons.peopleGroup, size: 20),
    ),
    const BottomNavigationBarItem(
      label: "Account",
      tooltip: "Account",
      icon: Icon(FontAwesomeIcons.user, size: 20),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlurBottomView(
      currentIndex: widget.selectedPage,
      onIndexChange: _onChangeScreen,
      filterX: 4.0,
      filterY: 4.0,
      backgroundColor: primary,
      selectedItemColor: pink,
      unselectedItemColor: secondary,
      bottomNavigationBarItems: [
        for (var item in navigationBarItemList) item,
      ],
    );
  }

  void _onChangeScreen(int index) {
    setState(() {
      if (index == 0) {
        Navigator.of(context).push(
            NoAnimationMaterialPageRoute(builder: (context) => const Home()));
      } else if (index == 1) {
        Navigator.of(context).push(
            NoAnimationMaterialPageRoute(builder: (context) => const Buy()));
      } else if (index == 2) {
        Navigator.of(context).push(NoAnimationMaterialPageRoute(
            builder: (context) => const Register()));
      } else if (index == 3) {
        Navigator.of(context).push(NoAnimationMaterialPageRoute(
            builder: (context) => const Selector()));
      } else if (index == 4) {
        Navigator.of(context).push(NoAnimationMaterialPageRoute(
            builder: (context) => const Account()));
      }
    });
  }
}
