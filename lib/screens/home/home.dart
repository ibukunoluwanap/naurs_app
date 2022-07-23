import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/models/category.dart';
import 'package:naurs/models/selector.dart';
import 'package:naurs/models/test_models.dart';
import 'package:naurs/models/todo.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/app_bar/sliver_app_bar.dart';
import 'package:naurs/widgets/card/classes/classes_card.dart';
import 'package:naurs/widgets/card/home/category_card.dart';
import 'package:naurs/widgets/card/selector_card.dart';
import 'package:naurs/widgets/card/home/to_do_card.dart';
import 'package:naurs/widgets/card/packages/packages_card.dart';
import 'package:naurs/widgets/navigation/fixed_navigation_bar.dart';
import 'package:naurs/widgets/shimmer/rectangle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedSelector = 0;

  bool isProfileComplete = false;
  bool isScreenLoaded = false;

  String selectedCategory = "Fitness";

  List<CategoryFilter> categoryList = <CategoryFilter>[];
  List<Todo> todoList = <Todo>[];
  List<SelectorFilter> selectorList = <SelectorFilter>[];
  List<ClassesModel> classesList = <ClassesModel>[];
  List<PackagesModel> packagesList = <PackagesModel>[];

  @override
  void initState() {
    super.initState();
    categoryList.add(CategoryFilter(title: "Fitness", isSelected: true));
    categoryList.add(CategoryFilter(title: "Music", isSelected: false));
    categoryList.add(CategoryFilter(title: "Fine Arts", isSelected: false));
    categoryList.add(CategoryFilter(title: "Dance", isSelected: false));
    todoList.add(Todo(title: "Complete Personal Info", isCompleted: false));
    todoList.add(Todo(title: "Add Billing Address", isCompleted: false));
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
            statusBarBrightness: Brightness.dark,
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
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: (dHeight / 100) * 20),
                        child: Column(
                          children: [
                            _buildCategoryFilter(dWidth, dHeight),
                            _buildTodo(dWidth, dHeight),
                            _buildSelectorFilter(dWidth),
                            _buildClasses(dWidth, dHeight),
                            _buildPackages(dWidth, dHeight),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                
                const FixedNavigationBar(selectedPage: 0),
              ],
            ),
          )),
    );
  }

  Widget _buildCategoryFilter(dWidth, dHeight) => SizedBox(
        width: dWidth,
        height: (dHeight / 100) * 10.0,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            var categoryItem = categoryList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (var item in categoryList) {
                    item.isSelected = false;
                  }
                  selectedCategory = categoryItem.title;
                  categoryItem.isSelected = true;
                });
              },
              child: categoryCard(dWidth, categoryItem, index),
            );
          },
        ),
      );

  Widget _buildTodo(dWidth, dHeight) {
    return isProfileComplete
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "To do",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primary),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Slide left to complete to-do list!",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    var todoItem = todoList[index];
                    return todoCard(todoItem);
                  })
            ]),
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
        // creating new class list to store active selected classes
        List<ClassesModel> newClassesList = <ClassesModel>[];
        for (var classItem in classesList) {
          if (selectedCategory == classItem.category) {
            newClassesList.add(classItem);
          }
        }
        // setting valid widget return
        innerFinalWidget = newClassesList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: newClassesList.length,
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
                    var classItem = newClassesList[index];
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
        // creating new package list to store active selected packages
        List<PackagesModel> newPackagesList = <PackagesModel>[];
        for (var packageItem in packagesList) {
          if (selectedCategory == packageItem.category) {
            newPackagesList.add(packageItem);
          }
        }
        // setting valid widget return
        innerFinalWidget = newPackagesList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: newPackagesList.length,
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
                      var classItem = newPackagesList[index];
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
