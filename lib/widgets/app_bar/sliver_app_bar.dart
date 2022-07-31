import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naurs/utils/colors.dart';
import 'package:flutter/services.dart';

Widget sliverAppBar() => SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: secondary,
        statusBarBrightness: Brightness.light, // iOS (dark icons)
        statusBarIconBrightness: Brightness.dark, // android (dark icons)
        systemNavigationBarDividerColor: Colors.transparent, // navbar color
      ),
      snap: true,
      floating: true,
      backgroundColor: secondary,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: const DecorationImage(
                image: AssetImage("assets/logo/icon_logo_trans.png")),
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(10.0),
            icon: Badge(
              badgeColor: pink,
              position: BadgePosition.topEnd(top: 0, end: 0),
              child: const Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
                color: primary,
              ),
            ))
      ],
    );
