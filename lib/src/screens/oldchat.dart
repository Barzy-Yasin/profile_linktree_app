

/*

// ignore_for_file: prefer_const_constructors

import 'package:profile_linktree_app/comments/commenters_data.dart';
import 'package:profile_linktree_app/route/screen_routes.dart';
import 'package:profile_linktree_app/src/models/commenters_model.dart';
import 'package:profile_linktree_app/src/screens/my_drawer.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _counter = 0;
  Color _sendMessageIconColor = Colors.greenAccent.shade700;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        drawer: SizedBox(
          // width: 220,
          height: double.infinity,
          child: Expanded(child: const MyDrawer()),
        ),
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          // entire_screen-column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //  header-column
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ScreenRoutes.init);
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'messages'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),

              //  box_messages-column
              Expanded(
                child: ListView.builder(
                  itemCount: commenterData.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    // final item = commenterData[index];

                    // getting the data from commenterData using CommentersModel(Data-Model)
                    // ignore: no_leading_underscores_for_local_identifiers
                    List<CommentersModel> _commenters = commenterData
                        .map((element) => CommentersModel.fromMap(element))
                        .toList();

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade200,
                        border: Border.all(
                          color: Colors.green.shade200,
                          width: 2.0,
                        ),
                      ),
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8.0),
                      alignment: Alignment.center,
                      //  inside_box_messages-column
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(
                                15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              // item["name"].toString().toUpperCase(),
                              _commenters[index].name,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 8.0),
                            child: Text(
                              // item["message"].toString().toUpperCase(),
                              _commenters[index].message,
                              // 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                              //     .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.black26,
                height: 2,
                thickness: 2,
              ),
              Container(
                height: 230,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      child: Text('\nsend me a message\n'.toUpperCase()),
                      onPressed: () {
                        setState(
                          () {
                            _counter++;
                          },
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.shade100,
                              border: Border.all(
                                color: Colors.black12,
                                // width: 2.0,
                              ),
                            ),
                            width: double.infinity,
                            height: 100,
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                            child: Text(
                              "message $_counter".toUpperCase(),
                            ),
                          ),
                          // TextFormField(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 7.0, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.shade100,
                                    border: Border.all(
                                      color: Colors.black12,
                                    ),
                                  ),
                                  width: 300,
                                  height: 43,
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 10.0, 0, 0),
                                  child: Text(
                                    "name".toUpperCase(),
                                  ),
                                ),
                                Container(
                                  height: 43,
                                  padding: const EdgeInsets.all(0),
                                  child: IconButton(
                                    icon: const Icon(Icons.send),
                                    iconSize: 30,
                                    // color: Colors.greenAccent.shade700,
                                    color: _sendMessageIconColor,
                                    // focusColor: Colors.black,
                                    onPressed: () {
                                      setState(
                                        () {
                                          _counter++;
                                          _sendMessageIconColor == Colors.green
                                              ? _sendMessageIconColor =
                                                  Colors.tealAccent
                                              : _sendMessageIconColor =
                                                  Colors.green;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/