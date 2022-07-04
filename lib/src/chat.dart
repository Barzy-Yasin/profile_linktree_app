import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          // entire_screen-column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                child: Column(
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
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
              ),

              //  box_messages-column
              SizedBox(
                width: double.infinity,
                height: 398,
                child: ListView(
                  
                  scrollDirection: Axis.vertical,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              'name'.toUpperCase(),
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
                              'Lorem ipsum is a placeholder text coggggggggggggggggggggggggggggggggggmmonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              'name'.toUpperCase(),
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
                              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              'name'.toUpperCase(),
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
                              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              'name'.toUpperCase(),
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
                              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              'name'.toUpperCase(),
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
                              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
                            child: Text(
                              'name'.toUpperCase(),
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
                              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 11, height: 1.4),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: Colors.white,
          child: Container(
            height: 230, 
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('\nsend me a message\n'.toUpperCase()),
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
                        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                        child: Text(
                          "message".toUpperCase(),
                        ),
                      ),
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
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                              child: Text(
                                "name".toUpperCase(),
                              ),
                            ),
                            Container(
                              height: 43,
                              padding: const EdgeInsets.all(0),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.send),
                                iconSize: 30,
                                color: Colors.greenAccent.shade700,
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
        ),
      ),
    );
  }
}

