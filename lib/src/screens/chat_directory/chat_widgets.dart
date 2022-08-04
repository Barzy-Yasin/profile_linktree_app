import 'package:flutter/material.dart';
import 'package:profile_linktree_app/src/screens/chat_directory/chat.dart';
import 'package:url_launcher/url_launcher_string.dart';

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