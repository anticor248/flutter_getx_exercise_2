import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_full_app/content_page.dart';
import 'package:flutter_getx_full_app/detail_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List imgAvatar = [];

  _readImgAvatar() async {
    await DefaultAssetBundle.of(context).loadString('json/img.json').then(
      (value) {
        setState(
          () {
            imgAvatar = json.decode(value);
          },
        );
      },
    );
  }

  @override
  void initState() {
    _readImgAvatar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Dependency Injection below
    final DetailController fav = Get.put(DetailController());

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //
    return Scaffold(
      body: Container(
        color: Colors.blue.withOpacity(.5),
        child: Stack(
          children: [
            Positioned(
                top: 50,
                left: 10,
                child: IconButton(
                  onPressed: () => Get.to(() => ContentPage()),
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Colors.black54,
                  ),
                )),
            Positioned(
              top: 120,
              left: 0,
              height: 100,
              width: width,
              child: Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          Get.arguments['imgArgument'],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['nameArgument'],
                            style: TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Top Level",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            color: Colors.blue.withOpacity(.7)),
                        child: Center(
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: width,
              height: 250,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFfcfffe),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 1,
                          offset: Offset(0, 10),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                          child: Row(
                        children: [
                          Text(
                            Get.arguments['titleArgument'],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container())
                        ],
                      )),
                      SizedBox(height: 20),
                      Container(
                        width: width,
                        child: Text(
                          Get.arguments['textArgument'],
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFFb8b8b8)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.watch_later, color: Color(0xFF69c5df)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['nameArgument'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    Get.arguments['timeArgument'],
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.monetization_on,
                                  color: Color(0xFFfb8483)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['prizeArgument'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Prize",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Color(0xFFfbc33e)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 540,
                left: 25,
                height: 50,
                child: Container(
                  child: RichText(
                      text: TextSpan(
                          text: "Total Participants ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black),
                          children: [
                        TextSpan(
                            text: "(11)",
                            style: TextStyle(color: Color(0xFFfbc33e)))
                      ])),
                )),
            //images
            Stack(
              children: [
                for (int i = 0; i < imgAvatar.length; i++)
                  Positioned(
                    top: 590,
                    left: (20 + i * 35).toDouble(),
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image: AssetImage(
                                imgAvatar[i]['img'],
                              ),
                              fit: BoxFit.cover)),
                    ),
                  )
              ],
            ),
            //favourite
            Positioned(
              top: 670,
              left: 25,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () => fav.favCounter(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add to favorite",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}