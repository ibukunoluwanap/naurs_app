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
                        margin: const EdgeInsets.only(top: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: const [
                            Text(
                              "11 June 2022",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: primary),
                            )
                          ],
                        ),
                      ),
                    ),
                    _buildClasses(dWidth, dHeight),
                    SliverPadding(
                        padding: EdgeInsets.only(bottom: (dHeight / 100) * 20))
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

    innerFinalWidget = classesList.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var classItem = classesList[index];
              return isScreenLoaded
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: ClassesListCard(classItem: classItem))
                  : Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: RectangleShimmer(height: (dHeight / 100) * 8));
            }, childCount: classesList.length),
          )
        : SliverToBoxAdapter(
            child: Container(
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
                      "No class available!",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )),
          );
    return innerFinalWidget;
  }
}
