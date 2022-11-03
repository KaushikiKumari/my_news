import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news/pages/news_detail_page.dart';
import 'package:my_news/utils/colors.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: InkWell(
        onTap: () {
          Get.to(NewsDetailPage(),
              transition: Transition.rightToLeftWithFade,
              duration: Duration(milliseconds: 600));
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteboxColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'News',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.darkblueColor,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Source',
                                    style: TextStyle(
                                        color: AppColors.darkblueColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            width: Get.width - 200,
                            child: Text(
                              'News NewsNewsNewsNewsNewsNewsNewsNewsNews NewsNewsNewsNewsNewsNews',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 0.5,
                                color: AppColors.darkblueColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '10 min ago',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.5,
                              color: AppColors.lighttextColor,
                            ),
                          ),
                        ]),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: AppColors.darkblueColor,
                      ),
                    )
                  ]),
            )),
      ),
    );
  }
}
