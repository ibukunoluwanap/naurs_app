import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naurs/utils/colors.dart';

Widget sliverAppBar() => SliverAppBar(
      snap: true,
      floating: true,
      backgroundColor: secondary,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipOval(
            child: Container(
          color: primary,
          padding: const EdgeInsets.all(3.5),
          child: Image.asset("assets/logo/icon_logo.png"),
        )),
      ),
      actions: [
        IconButton(
            padding: const EdgeInsets.all(10.0),
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: Badge(
              badgeContent: const Text(
                "20",
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w100,
                    color: secondary),
              ),
              padding: const EdgeInsets.all(3.5),
              elevation: 0.0,
              badgeColor: pink,
              showBadge: true,
              child: const Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
                color: primary,
              ),
            ))
      ],
    );
