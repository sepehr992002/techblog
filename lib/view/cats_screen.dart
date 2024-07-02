import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/components/fake_data.dart';
import 'package:tech_blog/view/home_screen.dart';
import '../gen/assets.gen.dart';
import '../components/my_colors.dart';
import '../components/my_texts.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32,),
                SvgPicture.asset(
                  Assets.images.tcbot,
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 24,),
                Text(
                  textAlign: TextAlign.center,
                  MyTexts.congrats,
                  style: theme.titleMedium,
                ),
                SizedBox(height: 12,),
                 TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: MyTexts.nameAndLastName,
                    hintStyle: theme.headlineMedium
                  ),
                ),
                SizedBox(height: 12,),
                Text(
                  MyTexts.chooseCats,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16,),
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
                SizedBox(height: 12,),
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
