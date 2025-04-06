import 'package:flutter/material.dart';
import 'package:shimmerpoc/presentation/widgets/shimmer_widget.dart';
import 'package:shimmerpoc/utils/colors.dart';

class HomeShimmerTemplate extends StatelessWidget {
  const HomeShimmerTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  ShimmerWidget(
                    width: width * 0.5,
                    height: 50,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),

                  ShimmerWidget(
                    width: width * 0.8,
                    height: 20,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                ],
              ),
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
                spacing: 20,
                children: [
                  //* My Friends section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      //* Title
                      ShimmerWidget(
                        width: width * 0.3,
                        height: 20,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),

                      //* Friends List
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ShimmerWidget(
                                width: 80,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  //* Post section
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ShimmerWidget(
                          width: width * 0.8,
                          height: 350,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
