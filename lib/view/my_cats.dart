import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/fake_data.dart';
import 'package:tech_blog/view/home_screen.dart';

import '../gen/assets.gen.dart';
import '../my_colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.tcbot,
                  height: 100,
                  width: 100,
                ),
                Text(
                  "تبریک میگم ایمیل با موفقیت تایید شد لطفا اطلاعات ثبت نام رو کامل کن",
                  style: TextStyle(color: Colors.black),
                ),
                const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: "نام و نام خانوادگی",
                  ),
                ),
                Text(
                  'دسته بندی هایی که دوست داری رو انتخاب کن',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    // to pin 2 in each other scrolls
                    shrinkWrap: true,
                    itemCount: tagList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add(tagList[index]);
                              }
                            });
                          },
                          child: MainTags(index: index));
                    },
                  ),
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 3,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    // to pin 2 in each other scrolls
                    shrinkWrap: true,
                    itemCount: selectedTags.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                            color: MyColors.surface),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                selectedTags[index].title,
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
