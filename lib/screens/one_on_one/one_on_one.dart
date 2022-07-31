import 'dart:async';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:naurs/models/test_models.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/app_bar/sliver_app_bar.dart';
import 'package:naurs/widgets/button/button.dart';
import 'package:naurs/widgets/card/classes/class_list_card.dart';
import 'package:naurs/widgets/navigation/fixed_navigation_bar.dart';
import 'package:naurs/widgets/shimmer/rectangle.dart';

class OneOnOne extends StatefulWidget {
  const OneOnOne({Key? key}) : super(key: key);

  @override
  State<OneOnOne> createState() => _OneOnOneState();
}

class _OneOnOneState extends State<OneOnOne> {
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
      child: Scaffold(
        backgroundColor: secondary,
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                sliverAppBar(),
                _buildFilter(dWidth, dHeight),
                _buildInstructors(dWidth, dHeight),
                SliverPadding(
                    padding: EdgeInsets.only(bottom: (dHeight / 100) * 20))
              ],
            ),
            const FixedNavigationBar(selectedPage: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildFilter(dWidth, dHeight) {
    return SliverToBoxAdapter(
        child: Container(
      width: dWidth,
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 6,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "A - Z",
                      style: TextStyle(color: primary, fontSize: 16.0),
                    ),
                    VerticalDivider(
                      color: darkGrey,
                      thickness: 1.0,
                    ),
                    Text(
                      "Music",
                      style: TextStyle(color: primary, fontSize: 16.0),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 4,
            child: button(
              onPressed: () {
                filterAction(context, dWidth, dHeight);
              },
              title: 'Filter',
              dWidth: dWidth,
              background: primary,
              color: secondary,
              padding: 3.0,
              fontSize: 16.0,
              borderRadius: 5.0,
              preWidget: const Icon(Icons.filter_list_rounded),
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildInstructors(dWidth, dHeight) {
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
                      "No instructor available!",
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

  Future filterAction(context, dWidth, dHeight) {
    return showCupertinoModalBottomSheet(
      context: context,
      barrierColor: primary.withOpacity(0.5),
      topRadius: const Radius.circular(20),
      builder: (context) => SizedBox(
        height: (dHeight / 100) * 40,
        child: Scaffold(
          backgroundColor: secondary,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text("Filter Instructor List", style: TextStyle(color: primary, fontSize: 16.0),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: button(
                          onPressed: () {},
                          title: 'A - Z Order',
                          dWidth: dWidth,
                          background: primary,
                          color: secondary,
                          padding: 3.0,
                          fontSize: 16.0,
                          borderRadius: 5.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: button(
                          onPressed: () {},
                          title: 'Z - A Order',
                          dWidth: dWidth,
                          background: Colors.transparent,
                          color: primary,
                          borderColor: primary,
                          padding: 3.0,
                          fontSize: 16.0,
                          borderRadius: 5.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Divider(color: darkGrey),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: button(
                          onPressed: () {},
                          title: 'Fitness',
                          dWidth: dWidth,
                          background: Colors.transparent,
                          color: darkGrey,
                          padding: 3.0,
                          fontSize: 16.0,
                          borderRadius: 5.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: button(
                          onPressed: () {},
                          title: 'Music',
                          dWidth: dWidth,
                          background: primary,
                          color: secondary,
                          padding: 3.0,
                          fontSize: 16.0,
                          borderRadius: 5.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: button(
                          onPressed: () {},
                          title: 'Fine Arts',
                          dWidth: dWidth,
                          background: Colors.transparent,
                          color: darkGrey,
                          padding: 3.0,
                          fontSize: 16.0,
                          borderRadius: 5.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: button(
                          onPressed: () {},
                          title: 'Dance',
                          dWidth: dWidth,
                          background: Colors.transparent,
                          color: darkGrey,
                          padding: 3.0,
                          fontSize: 16.0,
                          borderRadius: 5.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  button(
                    onPressed: () {},
                    title: 'Save',
                    dWidth: dWidth,
                    background: pink,
                    color: secondary,
                    padding: 3.0,
                    fontSize: 18.0,
                    borderRadius: 5.0,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
