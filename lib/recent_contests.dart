import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContests extends StatefulWidget {
  const RecentContests({Key? key}) : super(key: key);

  @override
  State<RecentContests> createState() => _RecentContestsState();
}

class _RecentContestsState extends State<RecentContests> {
  List info = [];

  _readDetail() async {
    await DefaultAssetBundle.of(context).loadString('json/detail.json').then(
      (value) {
        setState(
          () {
            info = json.decode(value);
          },
        );
      },
    );
  }

  @override
  void initState() {
    _readDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9294cc),
        elevation: 1,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Colors.blue.shade100,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //
                    for (int i = 0; i < info.length; i++)
                      (Container(
                        height: 240,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/detail/',
                              arguments: {
                                'nameArgument': info[i]['name'].toString(),
                                'titleArgument': info[i]['title'].toString(),
                                'textArgument': info[i]['text'].toString(),
                                'imgArgument': info[i]['img'].toString(),
                                'timeArgument': info[i]['time'].toString(),
                                'prizeArgument': info[i]['prize'].toString(),
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 10),
                            height: 220,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: i.isEven
                                    ? Color(0xFF69c5df)
                                    : Color(0xFF9294cc)),
                            child: Column(
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      info[i]['title'],
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Expanded(child: Container())
                                  ],
                                )),
                                SizedBox(height: 10),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    info[i]['text'],
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFFb8eefc)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Row(children: [
                                  for (int i = 0; i < 4; i++)
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                                image:
                                                    AssetImage(info[i]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                ]),
                              ],
                            ),
                          ),
                        ),
                      )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
