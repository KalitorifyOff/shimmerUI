import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shimmerpoc/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AppbarWidget(),
      ),
      body: SingleChildScrollView(
        // physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            //* Greet Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                spacing: 10,
                children: [
                  const Text(
                    "Hello, Renga!",
                    style: TextStyle(
                      fontSize: 30,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome back to SocApp homepage!",
                    style: TextStyle(color: Colors.black38.withAlpha(100)),
                  ),
                ],
              ),
            ),
            //* Post Sectoin
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 5,
                    spreadRadius: -15,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    //* My Friends section
                    myFriendsWidget(),

                    //* Post section
                    postSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget AppbarWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonWidget(Icons.widgets_outlined),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(Icons.memory_outlined, size: 30, color: primaryColor),
              const Text(
                "SocApp",
                style: TextStyle(fontSize: 20, color: primaryColor),
              ),
            ],
          ),
          IconButtonWidget(Icons.notifications_outlined),
        ],
      ),
    );
  }

  Widget IconButtonWidget(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: textColor),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
      ),
    );
  }

  Widget myFriendsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        //* Title
        const Text(
          "My Friends",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        //* Friends List
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return friendsProfileWidget(
                "Renga",
                "assets/images/profilePic.jpeg",
                isFirstIndex: index == 0,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget friendsProfileWidget(
    String? userName,
    String? userProfileUrl, {
    bool isFirstIndex = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        spacing: 10,
        children: [
          isFirstIndex
              ? DottedBorder(
                color: primaryColor.withAlpha(100),
                strokeWidth: 1,
                borderType: BorderType.Circle,
                dashPattern: [8, 7],
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.add, color: primaryColor, size: 30),
                ),
              )
              : CircleAvatar(
                backgroundImage: AssetImage(userProfileUrl!),
                radius: 30,
              ),
          Text(
            isFirstIndex ? "Add New" : userName ?? 'UserName',
            style: TextStyle(color: textColor, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget postSection() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 7,
      primary: false,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return postWidget(index);
      },
    );
  }

  Widget postWidget(int index) {
    return Container(
      width: double.infinity,
      height: 350,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: borderColor, width: 6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            //* Post Img
            Positioned.fill(
              child: Image.asset(
                "assets/images/model${index + 1}.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            //* Liner Gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withAlpha(80)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.7, 1.0],
                  ),
                ),
              ),
            ),
            //* Trending & more button
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [trendingButtonWidget(), moreButtonWidget()],
                ),
              ),
            ),
            //* User profile
            Align(
              alignment: Alignment.bottomCenter,
              child: userProfileWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget trendingButtonWidget() {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        spacing: 10,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text("🔥"),
          ),
          const Text("Trending", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget moreButtonWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: textColor.withAlpha(100),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ),
    );
  }

  Widget userProfileWidget() {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          spacing: 10,
          children: [
            //* User profile pic
            CircleAvatar(
              backgroundImage: const AssetImage(
                "assets/images/profilePic.jpeg",
              ),
              radius: 20,
            ),
            //* User name & verified icon & last seen
            Column(
              spacing: 0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Name & verified icon
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      "@renga",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.verified_user, color: Colors.blueAccent),
                  ],
                ),
                //* Last seen
                Text(
                  "Last seen 2 hours ago",
                  style: TextStyle(color: Colors.white.withAlpha(200)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
