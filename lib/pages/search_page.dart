import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news/helper/news_cards.dart';
import 'package:my_news/utils/colors.dart';
import 'package:my_news/utils/strings.dart';
import 'package:my_news/utils/strings_style.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: commonCutsomAppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          _searchBox(),
          _searchresults(),
          // _noresultfound(),
        ])));
  }

  AppBar commonCutsomAppBar() {
    return AppBar(
      backgroundColor: AppColors.appbarbackgroundColor,
      elevation: 0.0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 13, left: 5),
        child: Text(
          Strings.SEARCH_TITLE,
          style: StringsStyle.search_title_style,
        ),
      ),
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

  _searchBox() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Get.to(SearchPage(),
              transition: Transition.rightToLeftWithFade,
              duration: Duration(milliseconds: 600));
        },
        child: Container(
          height: 45,
          width: Get.width / 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.lightColor),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Center(
              child: TextFormField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon:
                            Icon(Icons.search, color: AppColors.darkblueColor)),
                    hintText: Strings.SEARCHBOX_HINT,
                    hintStyle: StringsStyle.searchbox_hint_style,
                    border: InputBorder.none,
                    errorBorder:
                        new OutlineInputBorder(borderSide: BorderSide.none),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  _searchresults() {
    return DelayedDisplay(
      delay: Duration(seconds: 1),
      child: Container(
          height: Get.height / 1 - 150,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              primary: true,
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return NewsCard();
              })),
    );
  }

  _noresultfound() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 200),
        SizedBox(
          height: 100,
          width: 100,
          child: Image(
            image: AssetImage("assets/images/empty.png"),
          ),
        ),
        SizedBox(height: 5),
        Text(
          Strings.RESULT_NOT_FOUND,
          style: StringsStyle.resultnotfound_style,
        ),
      ],
    ));
  }
}
