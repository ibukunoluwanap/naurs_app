import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/app_bar/sliver_app_bar.dart';
import 'package:naurs/widgets/navigation/fixed_navigation_bar.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isScreenLoaded = false;

  @override
  void initState() {
    super.initState();
    loadScreenData();
  }

  Future loadScreenData() async {
    setState(() => isScreenLoaded = false);
    await Future.delayed(const Duration(seconds: 2), () {});
    setState(() => isScreenLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: secondary,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: secondary,
            body: Stack(
              children: [
                CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    sliverAppBar(),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 50.0),
                        child: Column(
                          children: const [
                            Text("Account"),
                            Icon(
                              Icons.person,
                              size: 50,
                              color: grey,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                // _buildBottomNavigation(),
                const FixedNavigationBar(selectedPage: 4),
              ],
            ),
          )),
    );
  }
}
