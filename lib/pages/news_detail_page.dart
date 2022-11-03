import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news/utils/colors.dart';
import 'package:my_news/utils/strings_style.dart';
import 'package:readmore/readmore.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: commonCutsomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headingimage(),
                _newsheading(),
                _newsdescription(),
              ],
            ),
          ),
        ));
  }

  AppBar commonCutsomAppBar() {
    return AppBar(
      backgroundColor: AppColors.appbarbackgroundColor,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 13, left: 10),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.keyboard_arrow_left_outlined,
              size: 35, color: AppColors.whiteiconColor),
        ),
      ),
    );
  }

  _headingimage() {
    return Stack(children: [
      Container(
        height: Get.height / 3,
        width: Get.width / 1,
        color: AppColors.darkblueColor,
      ),
      Positioned(
        bottom: 0,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black12, AppColors.darktextColor])),
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                    "kasdkjan asdjka askjda dkas xaj xmasxdaxajsd asdk a cxsja xaks.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: StringsStyle.heading_style)),
          ),
        ),
      ),
    ]);
  }

  _newsheading() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
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
          SizedBox(height: 2),
          Text(
            '3 augest, 2021 at 04:00 pm',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 0.5,
              color: AppColors.lighttextColor,
            ),
          ),
        ],
      ),
    );
  }

  _newsdescription() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ReadMoreText(
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android appsand Android apps with the unified codebasezaxA.',
        trimLines: 12,
        colorClickableText: AppColors.bluetextColor,
        trimMode: TrimMode.Line,
        trimCollapsedText: '\n\nSee full story',
        style: TextStyle(color: AppColors.darktextColor),
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: AppColors.bluetextColor),
      ),
    );
  }
}
