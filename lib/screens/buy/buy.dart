import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/models/selector.dart';
import 'package:naurs/models/test_models.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/app_bar/sliver_app_bar.dart';
import 'package:naurs/widgets/card/classes/classes_card.dart';
import 'package:naurs/widgets/card/selector_card.dart';
import 'package:naurs/widgets/card/packages/packages_card.dart';
import 'package:naurs/widgets/navigation/fixed_navigation_bar.dart';
import 'package:naurs/widgets/shimmer/rectangle.dart';

class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  int selectedSelector = 0;

  bool isScreenLoaded = false;

  List<SelectorFilter> selectorList = <SelectorFilter>[];
  List<ClassesModel> classesList = <ClassesModel>[];
  List<PackagesModel> packagesList = <PackagesModel>[];

  @override
  void initState() {
    super.initState();
    selectorList.add(SelectorFilter(title: "Classes", isSelected: true));
    selectorList.add(SelectorFilter(title: "Packages", isSelected: false));

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
    packagesList.add(PackagesModel(
        isMine: false,
        image: "assets/img/test3.png",
        name: "Package Name",
        initialPrice: 54.00,
        bonusPrice: 10.0,
        sessions: 2,
        kidSessions: 0,
        oldSessions: 0,
        category: "Music",
        availableSpace: 8,
        updatedOn: "20/4/2022",
        desc:
            """Curabitur ullamcorper aliquet nisl, vitae condimentum justo luctus in. Nunc ultrices vestibulum ligula, gravida gravida urna dapibus et. Aliquam non sem ante. Aenean consequat ante."""));
    packagesList.add(PackagesModel(
        isMine: false,
        image: "assets/img/test4.png",
        name: "Package Name",
        initialPrice: 460.00,
        bonusPrice: 100.0,
        sessions: 1,
        kidSessions: 0,
        oldSessions: 0,
        category: "Fitness",
        availableSpace: 3,
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
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: (dHeight / 100) * 20),
                        child: Column(
                          children: [
                            _buildSelectorFilter(dWidth),
                            _buildClasses(dWidth, dHeight),
                            _buildPackages(dWidth, dHeight),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                // _buildBottomNavigation(),
                const FixedNavigationBar(selectedPage: 1),
              ],
            ),
          )),
    );
  }

  Widget _buildSelectorFilter(dWidth) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var selectorItem in selectorList)
              GestureDetector(
                  onTap: () {
                    setState(() {
                      for (var item in selectorList) {
                        item.isSelected = false;
                      }
                      int index = selectorList.indexOf(selectorItem);
                      selectedSelector = index;
                      selectorItem.isSelected = true;
                    });
                  },
                  child: selectorCard(dWidth, selectorItem))
          ],
        ),
      );

  Widget _buildClasses(dWidth, dHeight) {
    // setting default return widget
    Widget innerFinalWidget = const SizedBox.shrink();

    for (var selectorItem in selectorList) {
      if (selectorItem.isSelected && selectorItem.title == "Classes") {
        // setting valid widget return
        innerFinalWidget = classesList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: classesList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: dWidth / (dHeight / 1.8),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var classItem = classesList[index];
                    return isScreenLoaded
                        ? ClassesCard(classItem: classItem)
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
                      "No class available for selected category!",
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
    return innerFinalWidget;
  }

  Widget _buildPackages(dWidth, dHeight) {
    // setting default return widget
    Widget innerFinalWidget = const SizedBox.shrink();
    for (var selectorItem in selectorList) {
      if (selectorItem.isSelected && selectorItem.title == "Packages") {
        // setting valid widget return
        innerFinalWidget = packagesList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: packagesList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: dWidth / (dHeight / 1.8),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var classItem = packagesList[index];
                      return isScreenLoaded
                          ? PackagesCard(classItem: classItem)
                          : const RectangleShimmer();
                    }))
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
                      "No packages available for selected category!",
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
    return innerFinalWidget;
  }
}
