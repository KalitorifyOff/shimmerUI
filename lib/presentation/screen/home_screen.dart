import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmerpoc/domain/entity/user_entity.dart';
import 'package:shimmerpoc/presentation/bloc/user_bloc.dart';
import 'package:shimmerpoc/presentation/screen/home_shimmer_template.dart';
import 'package:shimmerpoc/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserEntity? userEntity;
  @override
  void initState() {
    //* Initial API call
    context.read<UserBloc>().add(GetUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: appbarWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          //* Refresh button to call the same get user API call
          context.read<UserBloc>().add(GetUserData());
        },
        child: const Icon(Icons.refresh, color: textColor),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoadedState) {
            userEntity = state.user;
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              //* Loading state
              return const HomeShimmerTemplate();
            } else if (state is UserLoadedState) {
              //* Loaded state
              return bodyWidget();
            } else {
              //* err state
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget bodyWidget({bool isLoading = false}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //* Greet Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              spacing: 10,
              children: [
                Text(
                  "Hello, ${userEntity!.loggedUserName!}!",
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
    );
  }

  Widget appbarWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButtonWidget(Icons.widgets_outlined),
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
          iconButtonWidget(Icons.notifications_outlined),
        ],
      ),
    );
  }

  Widget iconButtonWidget(IconData icon) {
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
            itemCount: userEntity!.friends!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return friendsProfileWidget(
                userEntity!.friends![index].name,
                userEntity!.friends![index].profilePath,
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
              : Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFfbcdb3),
                      Color(0xFFff6862),
                    ], // your custom gradient
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(
                  backgroundImage: AssetImage(userProfileUrl!),
                  radius: 30,
                ),
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
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor, width: 6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            //* Post Img
            Positioned.fill(
              child: Image.asset(
                "assets/images/model${index + 1}.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            //* Liner Gradient for user profile to elavate the user image, name, last seen
            //* and make it more visible
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
                  mainAxisAlignment:
                      (userEntity!.posts![index].isTrending!)
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                  children: [
                    if (userEntity!.posts![index].isTrending!)
                      trendingButtonWidget(),
                    moreButtonWidget(),
                  ],
                ),
              ),
            ),
            //* User profile
            Align(
              alignment: Alignment.bottomCenter,
              child: userProfileWidget(
                userEntity!.posts![index].user!.profilePath!,
                userEntity!.posts![index].user!.name,
                userEntity!.posts![index].user!.lastSeen,
              ),
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

  Widget userProfileWidget(
    String? profileUrl,
    String? userName,
    String? lastSeen,
  ) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          spacing: 10,
          children: [
            //* User profile pic
            CircleAvatar(
              backgroundImage: AssetImage(
                profileUrl ?? "assets/images/profilePic1.jpg",
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
                      userName ?? "User Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.verified,
                      color: Colors.blueAccent,
                      size: 18,
                    ),
                  ],
                ),
                //* Last seen
                Text(
                  lastSeen ?? "Last seen 2 hours ago",
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
