import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher_string.dart';

class Chat extends StatelessWidget {
   Chat({Key? key}) : super(key: key);

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static const Color primaryColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
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
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return  OutputContainerWidget(
                      name: "name",
                      message: "message",
                      url: 'https://www.google.com/',
                      index: "${index+1}",
                    );
                  },
                ),
              ),
              // inputs section
              const Divider(
                // color: Colors.black26,
                color: primaryColor,
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
                          const InputContainer(hintText: 'name'),
                          const InputContainer(hintText: 'message'),
                          const InputContainer(hintText: 'Url'),
                          Container(
                            // color: Colors.yellow,
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.teal.shade50,
                              border: Border.all(
                                // color: Colors.blue,
                                color: primaryColor,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'SEND',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: primaryColor,
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

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;
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
      child: TextField(
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
              "$index.  name.toUpperCase()",
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
