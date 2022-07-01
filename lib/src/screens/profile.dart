// import 'dart:html';

// import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("\n"),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      // color: const Color.fromARGB(255, 119, 253, 170),
                      color: const Color.fromARGB(125, 189, 255, 215),
                      width: 4.0), // #BDFFD77D
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2000.0),
                  child: Image.asset('images/my_profile.png'),
                ),
              ),
              Text(
                "\nBarzi Yassin".toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Avenir',
                ),
              ),
              const SizedBox(
                width: 270,
                height: 120,
                child: Text(
                  "\nLorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const Card(
                      color: Color.fromARGB(
                          255, 243, 242, 255), // rgba(243, 242, 255, 1)
                      child: ListTile(
                        horizontalTitleGap: -24.0,
                        leading: FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Colors.black,
                        ),
                        title: Text(
                          "LinkedIn Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () =>
                      launchUrlString('https://www.linkedin.com/feed/'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const Card(
                      color: Color.fromARGB(
                          255, 199, 228, 255), // rgba(199, 228, 255, 1)
                      child: ListTile(
                        horizontalTitleGap: -24.0,
                        leading: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Facebook Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () => launchUrlString('https://www.facebook.com/'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const Card(
                      color: Color.fromARGB(
                          255, 255, 242, 242), // rgba(255, 242, 242, 1)
                      child: ListTile(
                        horizontalTitleGap: -24.0,
                        leading: FaIcon(
                          FontAwesomeIcons.instagramSquare,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Instagram Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () => launchUrlString('https://www.instagram.com/'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const Card(
                      color: Color.fromARGB(
                          255, 255, 251, 242), // rgba(255, 251, 242, 1)
                      child: ListTile(
                        horizontalTitleGap: -24.0,
                        leading: FaIcon(
                          FontAwesomeIcons.globe,
                          color: Colors.black,
                        ),
                        title: Text(
                          "My Website",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () => launchUrlString('https://www.google.com'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(50, 76, 175, 79),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.whatsapp_rounded),
                        iconSize: 30,
                        color: const Color.fromARGB(255, 13, 185, 21)),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade50,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mail_outline_rounded),
                      iconSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange.shade50,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_outlined),
                        iconSize: 30,
                        color: const Color.fromARGB(255, 13, 185, 21)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
