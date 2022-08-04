// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profile_linktree_app/src/screens/chat_directory/chat_widgets.dart';
import 'package:profile_linktree_app/src/screens/chat_directory/db.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  static const Color primaryColor = Colors.teal;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // ignore: unused_field

  final TextEditingController nameController = TextEditingController();

  final TextEditingController messageController = TextEditingController();

  final TextEditingController urlController = TextEditingController();

  // final int docLength = Stream

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Chat.primaryColor,
          centerTitle: true,
          title: Text(
            'messages'.toUpperCase(),
            style: const TextStyle(fontSize: 20, letterSpacing: 2),
          ),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              // body section
              Expanded(
                  // /profilelinktree/person/usersmessages/AcnMjy1nU3LKpvSDGZYJ
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('profilelinktree')
                    .doc('person')
                    .collection('usersmessages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("err ${snapshot.error}");
                  } else if (snapshot.data == null || !snapshot.hasData) {
                    return const Text('snapshot is empty(StreamBuilder)');
                  }

                  // snapshot.data!.docs.first;
                  print('22222');
                  print('docs.length= ${snapshot.data!.docs.length}');
                  print(snapshot.data);

                  snapshot.data?.docs;

                  // return Text(snapshot.data!.docs.length.toString());
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentRecord = snapshot.data!.docs[index].data(); 
                      return OutputContainerWidget(
                        name: currentRecord["name"],
                        message: currentRecord["message"],
                        url: currentRecord["url"],
                        index: "${index + 1}",
                      );
                    },
                  );
                },
              )),
              // inputs section
              const Divider(
                // color: Colors.black26,
                color: Chat.primaryColor,
                height: 2,
                thickness: 1,
              ),
              Container(
                height: 240,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 230,
                      margin: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Column(
                        children: [
                          InputContainer(
                              hintText: '*name',
                              currentController: nameController),
                          InputContainer(
                              hintText: '*message',
                              currentController: messageController),
                          InputContainer(
                              hintText: 'Url',
                              currentController: urlController),
                          Container(
                            // color: Colors.yellow,
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.teal.shade50,
                              border: Border.all(
                                // color: Colors.blue,
                                color: Chat.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                print(nameController.value.text);
                                print(messageController.value.text);
                                print(urlController.value.text);
                                addDataToDB(
                                  name: nameController.value.text,
                                  message: messageController.value.text,
                                  url: urlController.value.text,
                                );
                              },
                              child: const Text(
                                'SEND',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Chat.primaryColor,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          )
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
