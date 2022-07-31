import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/models/test_models.dart';
import 'package:naurs/models/week.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/app_bar/sliver_app_bar.dart';
import 'package:naurs/widgets/card/book/week_card.dart';
import 'package:naurs/widgets/card/classes/class_list_card.dart';
import 'package:naurs/widgets/navigation/fixed_navigation_bar.dart';
import 'package:naurs/widgets/shimmer/rectangle.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  int selectedDay = 0;

  bool isScreenLoaded = false;

  List<ClassesModel> classesList = <ClassesModel>[];
  List<WeekFilter> weekList = <WeekFilter>[];

  @override
  void initState() {
    super.initState();
    // Test data
    weekList.add(WeekFilter(
      title: "Mon",
      isSelected: true,
    ));
    weekList.add(WeekFilter(
      title: "Tue",
      isSelected: false,
    ));
    weekList.add(WeekFilter(
      title: "Wed",
      isSelected: false,
    ));
    weekList.add(WeekFilter(
      title: "Thur",
      isSelected: false,
    ));
    weekList.add(WeekFilter(
      title: "Fri",
      isSelected: false,
    ));
    weekList.add(WeekFilter(
      title: "Sat",
      isSelected: false,
    ));
    weekList.add(WeekFilter(
      title: "Sun",
      isSelected: false,
    ));

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
                _buildCalendar(dWidth, dHeight),
                _buildDate(),
                _buildClasses(dWidth, dHeight),
                SliverPadding(
                    padding: EdgeInsets.only(bottom: (dHeight / 100) * 20))
              ],
            ),
            const FixedNavigationBar(selectedPage: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar(dWidth, dHeight) {
    return SliverToBoxAdapter(
        child: Container(
      width: dWidth,
      height: (dHeight / 100) * 6,
      margin: const EdgeInsets.only(top: 20.0),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weekList.length,
        itemBuilder: (BuildContext context, int index) {
          var weekItem = weekList[index];
          int first = weekList.indexOf(weekList.first);
          int last = weekList.indexOf(weekList.last);
          return GestureDetector(
            onTap: () {
              setState(() {
                for (var item in weekList) {
                  item.isSelected = false;
                }
                int index = weekList.indexOf(weekItem);
                selectedDay = index;
                weekItem.isSelected = true;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: index == first ? 10.0 : 0.0,
                  right: index == last ? 10.0 : 0.0),
              child: weekCard(dWidth, weekItem),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
      ),
    ));
  }

  Widget _buildDate() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: const Text(
          "11 June 2022",
          style: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.bold, color: primary),
        ),
      ),
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
