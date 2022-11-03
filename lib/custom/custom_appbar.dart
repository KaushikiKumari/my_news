import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news/custom/custom_button.dart';
import 'package:my_news/utils/colors.dart';
import 'package:my_news/utils/strings.dart';
import 'package:my_news/utils/strings_style.dart';

AppBar customAppBar() {
  var CityName = [
    "Nepal",
    "USA",
    "India",
    "Sri Lanka",
    "England",
    "Sweden",
    "Pacific islands",
  ];
  var choosecity = 1;
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(top: 13, left: 5),
      child: Text(
        Strings.TITLE,
        style: StringsStyle.title_style,
      ),
    ),
    backgroundColor: AppColors.appbarbackgroundColor,
    elevation: 0.0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 13, right: 10),
        child: InkWell(
          splashColor: AppColors.appbarbackgroundColor,
          onTap: () {
            Get.bottomSheet(
              Container(
                height: Get.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: AppColors.whiteboxColor),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Wrap(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 6,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                Strings.CHOOSE_LOCATION,
                                style: StringsStyle.chooselocation_style,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                              child: Divider(),
                            ),
                            Container(
                                height: 170,
                                child: ListView.builder(
                                    itemCount: CityName.length,
                                    // shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left:15, right: 10),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              choosecity = index;
                                            });
                                          },
                                          child: Container(
                                              height: 40,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      CityName[index],
                                                      style: StringsStyle
                                                          .cityname_style,
                                                    ),
                                                    InkWell(
                                                      splashColor: AppColors
                                                          .appbarbackgroundColor,
                                                      onTap: () {
                                                        setState(() {
                                                          choosecity = index;
                                                        });
                                                      },
                                                      child: Container(
                                                          child: choosecity ==
                                                                  index
                                                              ? Icon(
                                                                  Icons
                                                                      .radio_button_checked,
                                                                  color: AppColors
                                                                      .appbarbackgroundColor)
                                                              : Icon(Icons
                                                                  .radio_button_unchecked_outlined)),
                                                    )
                                                  ])),
                                        ),
                                      );
                                    })),
                            SizedBox(height: 8),
                            Center(
                                child: CustomButton(
                                    text: "Apply", width: 150, height: 45))
                          ]),
                    ],
                  );
                }),
              ),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Strings.LOCATION,
                style: StringsStyle.location_style,
              ),
              SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Icon(Icons.location_on,
                      color: AppColors.whiteiconColor, size: 17),
                  Text(
                    Strings.COUNTRY_NAME,
                    style: StringsStyle.country_name_style,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
