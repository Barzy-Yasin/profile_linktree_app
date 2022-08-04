// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  static const Color primaryColor = Colors.teal;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // ignore: unused_field
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController messageController = TextEditingController();

  final TextEditingController urlController = TextEditingController();

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
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("err ${snapshot.error}");
                  } else if (snapshot.data == null || !snapshot.hasData) {
                    return const Text('snapshot is empty(StreamBuilder)');
                  }

                  // snapshot.data!.docs.first;
                  print('22222');
                  print(snapshot.data!.docs.length.toString());
                  print(snapshot.data);

                  snapshot.data?.docs;
                  // return Text(snapshot.data!.docs.length.toString());
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      print('11111');

                      return OutputContainerWidget(
                        name: snapshot.data!.docs[index].data()["name"],
                        message: snapshot.data!.docs[index].data()["message"],
                        url: snapshot.data!.docs[index].data()["url"],
                        index: "${index + 1}",
                      );
                    },
                  );

                  // return ListView.separated(
                  //     itemCount: snapshot.data!.docs.length,
                  //     separatorBuilder: (BuildContext context, int index) {
                  //       return const Divider();
                  //     },
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Text("${index+1}:     ");
                  //       // ${snapshot.data!.docs[index]
                  //       //     .data()["first_name"]}

                  //     });
                },
              )
                  // child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  //   // stream: _db.collection('names').snapshots(),
                  //   stream: _db.collection('collectionPath').doc('person').collection('usersmessages').snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const CircularProgressIndicator();
                  //     } else if (snapshot.hasError) {
                  //       return Text("err ${snapshot.error}");
                  //     } else if (snapshot.data == null || !snapshot.hasData) {
                  //       return const Text('snapshot is empty(StreamBuilder)');
                  //     }

                  //     // snapshot.data!.docs;

                  //     return ListView.builder(
                  //       itemCount: snapshot.data!.docs.length,
                  //       itemBuilder: (context, index) {
                  //         return OutputContainerWidget(
                  //           name: snapshot.data!.docs[index].data()["name"],
                  //           message: snapshot.data!.docs[index].data()["message"],
                  //           url: snapshot.data!.docs[index].data()["url"],
                  //           index: "${index + 1}",
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),

                  // child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  //   future: getDataOnceUsingFuture(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const Center(child: CircularProgressIndicator());
                  //     } else if (snapshot.hasError) {
                  //       return Text(snapshot.error.toString());
                  //     } else if (snapshot.data == null) {
                  //       return const Text('snapshottt no data');
                  //     }
                  //     // return Text(snapshot.data.toString());
                  //     // return Text(snapshot.data!.docs.toString()); // returns firestore instances
                  //     // return Text(snapshot.data!.docs.length.toString()); // returns number of documents inside the collection

                  //     // snapshot.data!.docs.map((doc) => print (doc.data()));
                  //     // return Text(snapshot.data!.docs.length.toString());
                  //     // return Text(snapshot.data.toString());
                  //     return ListView.builder(
                  //       itemCount: snapshot.data!.docs.length,
                  //       itemBuilder: (context, index) {
                  //         return OutputContainerWidget(
                  //           name: snapshot.data!.docs[index].data()["name"],
                  //           message: snapshot.data!.docs[index].data()["message"],
                  //           url: snapshot.data!.docs[index].data()["url"],
                  //           index: "${index + 1}",
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                  ),
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

  Future<DocumentReference> addDataToDB(
      {required String name,
      required String message,
      required String url}) async {
    // ignore: no_leading_underscores_for_local_identifiers
    DocumentReference _doc = await _db
        .collection('profilelinktree')
        .doc('person')
        .collection('usersmessages')
        .add({
      "name": name,
      "message": message,
      "url": url,
    });
    // DocumentReference _doc = await _db.collection('something1').doc('2').collection('3').doc('4').collection('fdsa').add({"data": "123212321"});
    return _doc;
  }

  // returning all the data inside a collection once
  Future<QuerySnapshot<Map<String, dynamic>>> getDataOnceUsingFuture() async {
    return await _db
        .collection('profilelinktree')
        .doc('person')
        .collection('usersmessages')
        .get();
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.hintText,
    required this.currentController,
  }) : super(key: key);

  final String hintText;
  final TextEditingController currentController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
        border: Border.all(
          color: Chat.primaryColor,
          width: 0.8,
        ),
      ),
      width: double.infinity,
      height: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15),
      child: TextFormField(
        controller: currentController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '${hintText.toUpperCase()}:',
        ),
      ),
    );
  }
}

class OutputContainerWidget extends StatelessWidget {
  const OutputContainerWidget({
    Key? key,
    required this.name,
    required this.message,
    required this.url,
    required this.index,
  }) : super(key: key);

  final String name;
  final String message;
  final String url;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
        border: Border.all(
          color: Chat.primaryColor,
          width: 1.50,
        ),
      ),
      width: double.infinity,
      // height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      alignment: Alignment.center,
      //  inside_box_messages-column
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
            child: Text(
              // 'name'.toUpperCase(),
              "$index.  ${name.toUpperCase()}",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(33.0, 0.0, 15.0, 10.0),
                child: Text(
                  // 'role description'.toUpperCase(),
                  message.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 12, height: 1.4),
                  textAlign: TextAlign.start,
                  // maxLines: 3,
                ),
              ),
              Positioned(
                right: 20,
                bottom: 10,
                child: InkWell(
                  child: const Text(
                    'LINK',
                    style: TextStyle(
                        color: Chat.primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    launchUrlString(url);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}














/*

StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firebaseFirestore.collection('names').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("err ${snapshot.error}");
                    } else if (snapshot.data == null || !snapshot.hasData) {
                      return Text('snapshot is empty(StreamBuilder)');
                    }

                    snapshot.data!.docs.first;

                    // return 
                  },
                ),

*/




/*

StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firebaseFirestore.collection('names').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("err ${snapshot.error}");
                    } else if (snapshot.data == null || !snapshot.hasData) {
                      return Text('snapshot is empty(StreamBuilder)');
                    }

                    snapshot.data!.docs.first;

                    return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Text("${index+1}: ${snapshot.data!.docs[index]
                              .data()["first_name"]}");
                        });
                  },
                ),

*/