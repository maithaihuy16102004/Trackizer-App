import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/view/home/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabview = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: currentTabview),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/img/bottom_bar_bg.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 0;
                                currentTabview = const HomeView();
                              });
                            },
                            icon: Image.asset(
                              "assets/img/home.png",
                              width: 50,
                              height: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 1;
                                currentTabview = Container();
                              });
                            },
                            icon: Image.asset(
                              "assets/img/budgets.png",
                              width: 50,
                              height: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                            height: 100,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 2;
                                currentTabview = Container();
                              });
                            },
                            icon: Image.asset(
                              "assets/img/calendar.png",
                              width: 50,
                              height: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectTab = 3;
                                currentTabview = Container();
                              });
                            },
                            icon: Image.asset(
                              "assets/img/creditcards.png",
                              width: 50,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
