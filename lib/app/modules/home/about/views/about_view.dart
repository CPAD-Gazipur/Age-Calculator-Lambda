import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:user_profile_avatar/user_profile_avatar.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        title: Text(
          'Founder information',
          style: TextStyle(
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff70e000),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Web Developer :: [Yeaseen Ahmed]",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            UserProfileAvatar(
              avatarUrl: "https://avatars.githubusercontent.com/u/92775489?v=4",
              radius: 120,
              avatarSplashColor: Color(0xff70e000),
              avatarBorderData: AvatarBorderData(
                borderColor: Color(0xff70e000),
                borderWidth: 5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Yeaseen Ahmed",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_rounded,
                          color: Color(0xff70e000),
                          size: 30,
                        ),
                        Text(
                          " shekhyeaseen@gmail.com",
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: Color(0xff70e000),
                          size: 30,
                        ),
                        Text(
                          "01720637100, 01712700477",
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xff70e000),
                          size: 30,
                        ),
                        Text(
                          "Hakkani,Gazipur,Bangladesh",
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Visit me on  ::  ",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    letterSpacing: 3,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launch("https://www.github.com/yeaseen-564");
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: Color(0xff70e000),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launch("https://www.facebook.com/yeaseen.ahmed.75");
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xff70e000),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launch(
                        "https://www.linkedin.com/in/yeaseen-ahmed-77bb98231/");
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Color(0xff70e000),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launch("https://www.instagram.com/yeaseenahmed37/");
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Color(0xff70e000),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
