import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/segment_button.dart';
import 'package:trackizer/common_widget/status_button.dart';
import 'package:trackizer/common_widget/subcription_home_row.dart';
import 'package:trackizer/common_widget/upcoming_bill_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubcription = true;

  // Dữ liệu Subscriptions
  final List<Map<String, dynamic>> subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
    {
      "name": "Youtube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft Onedrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
    {
      "name": "Netflix",
      "icon": "assets/img/netflix_logo.png",
      "price": "15.00"
    },
  ];

  // Dữ liệu Upcoming Bills
  final List<Map<String, dynamic>> bilArr = [
    {"name": "Spotify", "date": DateTime(2025, 10, 16), "price": "5.99"},
    {
      "name": "Youtube Premium",
      "date": DateTime(2025, 10, 17),
      "price": "18.99"
    },
    {
      "name": "Microsoft Onedrive",
      "date": DateTime(2025, 10, 18),
      "price": "29.99"
    },
    {
      "name": "Netflix",
      "date": DateTime(2025, 10, 19),
      "price": "15.00",
      "icon": "assets/img/netflix_logo.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header area
            Container(
              height: media.width * 1.1,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/img/home_bg.png"),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Active Subs",
                                value: "12",
                                statusColor: TColor.secondary,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Highest subs",
                                value: "\$19.99",
                                statusColor: TColor.primary10,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Lowest Subs",
                                value: "\$5.99",
                                statusColor: TColor.secondaryG,
                                onPressed: () {},
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

            // Segment button switcher
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: "Your subscriptions",
                      isActive: isSubcription,
                      onPressed: () {
                        setState(() {
                          isSubcription = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SegmentButton(
                      title: "Upcoming bills",
                      isActive: !isSubcription,
                      onPressed: () {
                        setState(() {
                          isSubcription = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Hiển thị danh sách theo lựa chọn
            if (isSubcription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
                itemBuilder: (context, index) {
                  final sObj = subArr[index];
                  return SubcriptionHomeRow(
                    sObj: sObj,
                    onPressed: () {},
                  );
                },
              )
            else
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bilArr.length,
                itemBuilder: (context, index) {
                  final sObj = bilArr[index];
                  return UpcomingBillRow(
                    sObj: sObj,
                    onPressed: () {},
                  );
                },
              ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
