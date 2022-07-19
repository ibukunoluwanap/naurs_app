import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/models/test_models.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/app_bar/sliver_app_bar.dart';
import 'package:naurs/widgets/card/classes/class_list_card.dart';
import 'package:naurs/widgets/navigation/fixed_navigation_bar.dart';
import 'package:naurs/widgets/shimmer/rectangle.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  int selectedSelector = 0;

  bool isScreenLoaded = false;

  List<ClassesModel> classesList = <ClassesModel>[];

  @override
  void initState() {
    super.initState();
    // Test data
    classesList.add(ClassesModel(
        isMine: true,
        image: "assets/img/test1.png",
        name: "Class Name",
        sessions: 2,
        category: "Dance",
        price: 170.00,
        availableSpace: 10,
        updatedOn: "20/4/2022",
        desc:
            """Curabitur ullamcorper aliquet nisl, vitae condimentum justo luctus in. Nunc ultrices vestibulum ligula, gravida gravida urna dapibus et. Aliquam non sem ante. Aenean consequat ante."""));
    classesList.add(ClassesModel(
        isMine: false,
        image: "assets/img/test2.png",
        name: "Class Name",
        sessions: 3,
        category: "Fine Arts",
        price: 250.00,
        availableSpace: 6,
        updatedOn: "20/4/2022",
        desc:
            """ullamcorper aliquet nisl, vitae condimentum justo luctus in. Nunc ultrices vestibulum ligula, gravida gravida urna dapibus et. Aliquam non sem ante. Aenean consequat ante. Curabitur ullamcorper aliquet nisl, vitae condimentum justo luctus in. Nunc ultrices vestibulum ligula, gravida gravida urna dapibus et. Aliquam non sem ante. Aenean consequat ante. gravida gravida urna dapibus et. Aliquam non sem ante. Aenean consequat ante. vitae condimentum justo luctus in. Nunc ultrices vestibulum ligula, gravida gravida urna dapibus non sem ante. Aenean consequat ante. Curabitur ullamcorper aliquet nisl, vitae condimentum justo luctus in. Nunc ultrices vestibulum ligula, gravida gravida urna. ligula, gravida gravida urna dapibus et. Aliquam non sem ante. Aenean consequat ante."""));

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
            statusBarColor: secondary,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
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
                          children: [
                            _buildClasses(dWidth, dHeight),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                // _buildBottomNavigation(),
                const FixedNavigationBar(selectedPage: 2),
              ],
            ),
          )),
    );
  }

  Widget _buildClasses(dWidth, dHeight) {
    // setting default return widget
    Widget innerFinalWidget = const SizedBox.shrink();

    // setting valid widget return
    innerFinalWidget = classesList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: classesList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var classItem = classesList[index];
                return isScreenLoaded
                    ? ClassesListCard(classItem: classItem)
                    : const RectangleShimmer();
              },
            ),
          )
        : Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Column(
              children: const [
                Icon(
                  Icons.folder_delete_rounded,
                  size: 100.0,
                  color: grey,
                ),
                Text(
                  "Not class available for selected category!",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ));
    return innerFinalWidget;
  }
}
