import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/utils/html_parse.dart';
import 'package:naurs/widgets/button/button.dart';

class InstructorsCard extends StatefulWidget {
  const InstructorsCard({Key? key, this.instructorItem}) : super(key: key);
  final dynamic instructorItem;

  @override
  State<InstructorsCard> createState() => _InstructorsCardState();
}

class _InstructorsCardState extends State<InstructorsCard> {
  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;
    var instructorItem = widget.instructorItem;

    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        classDetail(context, instructorItem, dWidth, dHeight);
      },
      child: ListTile(
        tileColor: grey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: const EdgeInsets.all(5.0),
        leading: Container(
          width: (dWidth / 100) * 15,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: pink),
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(instructorItem.image),
            ),
          ),
        ),
        title: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instructorItem.name,
                  style: const TextStyle(
                    fontSize: 10,
                    color: primary,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  instructorItem.name,
                  style: const TextStyle(
                    fontSize: 8,
                    color: pink,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  parseHtmlString(instructorItem.desc),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 8,
                    color: primary,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w100,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class detail information
Future classDetail(context, instructorItem, dWidth, dHeight) {
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
                          image: AssetImage(instructorItem.image),
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
                                instructorItem.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, color: secondary),
                              ),
                              Text(
                                "${instructorItem.category} | ${instructorItem.price} AED",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(fontSize: 10, color: pink),
                              ),
                              Text(
                                instructorItem.updatedOn,
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
                    instructorItem.desc,
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
                      "${instructorItem.sessions}",
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
                      "${instructorItem.availableSpace}",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: const Text(
                  "Benefits",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: primary),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: (dHeight / 100) * 15),
                margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 20.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "• ",
                          ),
                          Expanded(
                            child: Text(
                              "$index",
                              style:
                                  const TextStyle(color: primary, fontSize: 12),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                child: button(
                    dWidth: dWidth,
                    onPressed: () {},
                    title: "Book Now",
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
