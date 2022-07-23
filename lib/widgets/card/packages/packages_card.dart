import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/utils/html_parse.dart';
import 'package:naurs/widgets/button/button.dart';

class PackagesCard extends StatefulWidget {
  const PackagesCard({Key? key, this.classItem}) : super(key: key);
  final dynamic classItem;

  @override
  State<PackagesCard> createState() => _PackagesCardState();
}

class _PackagesCardState extends State<PackagesCard> {
  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;
    var classItem = widget.classItem;

    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        classDetail(context, classItem, dWidth, dHeight);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(classItem.image),
                )),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: (dWidth / 100) * 40,
            child: BlurryContainer(
              blur: 5,
              color: primary.withOpacity(.5),
              padding: const EdgeInsets.all(5.0),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classItem.name,
                    style: const TextStyle(
                      fontSize: 10,
                      color: secondary,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    parseHtmlString(classItem.desc),
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 8,
                      color: secondary,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w100,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: (dHeight / 100) * 1,
              right: (dWidth / 100) * 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
                decoration: BoxDecoration(
                  color: classItem.isMine ? pink : secondary,
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                      spreadRadius: -3,
                    )
                  ],
                ),
                child: Text(
                  "${classItem.initialPrice} AED",
                  style: TextStyle(
                      fontSize: 8.0,
                      color: classItem.isMine ? secondary : pink),
                ),
              )),
        ],
      ),
    );
  }
}

Future classDetail(context, classItem, dWidth, dHeight) {
  return showCupertinoModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    topRadius: const Radius.circular(20),
    builder: (context) => SizedBox(
      height: (dHeight / 100) * 80,
      child: Scaffold(
        backgroundColor: secondary,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: dWidth,
                    height: (dHeight / 100) * 25,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                          image: AssetImage(classItem.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: BlurryContainer(
                      blur: 4,
                      width: dWidth,
                      color: primary.withOpacity(.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 8.0),
                      borderRadius: BorderRadius.circular(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                classItem.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, color: secondary),
                              ),
                              Text(
                                "${classItem.category} | ${classItem.initialPrice} AED",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(fontSize: 10, color: pink),
                              ),
                              Text(
                                classItem.updatedOn,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w100,
                                    color: grey),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.ios_share_rounded,
                              color: pink,
                              size: 20.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints(maxHeight: (dHeight / 100) * 30),
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    classItem.desc,
                    style: const TextStyle(fontSize: 10.0, color: primary),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: (dHeight / 100) * 30),
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.schedule, color: pink),
                        SizedBox(width: 10.0),
                        Text(
                          "Total sessions",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        ),
                      ],
                    ),
                    Text(
                      "${classItem.sessions}",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: (dHeight / 100) * 30),
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.schedule, color: pink, size: 20.0),
                        SizedBox(width: 10.0),
                        Text(
                          "Kid Sessions",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        ),
                      ],
                    ),
                    Text(
                      "${classItem.kidSessions}",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: (dHeight / 100) * 30),
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.schedule, color: pink, size: 20.0),
                        SizedBox(width: 10.0),
                        Text(
                          "Old Sessions",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        ),
                      ],
                    ),
                    Text(
                      "${classItem.oldSessions}",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: (dHeight / 100) * 30),
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(FontAwesomeIcons.building,
                            color: pink, size: 20.0),
                        SizedBox(width: 10.0),
                        Text(
                          "Available space",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        ),
                      ],
                    ),
                    Text(
                      "${classItem.availableSpace}",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                child: button(
                    dWidth: dWidth,
                    onPressed: () {},
                    title: "Purchase Now",
                    color: secondary,
                    background: primary),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
