import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../gen/assets.gen.dart';

class RegisterInto extends StatelessWidget {
  const RegisterInto({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.tcbot,
            height: 60,
            width: 60,
          ),
          Text(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              'به تک بلاگ خوش اومدی برای ارسال مقاله و پادکست حتما باید ثبت نام کنی'),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: height / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16))),
                      child: Column(
                        children: [
                          Text(
                            "ایمیلت رو وارد کن",
                            style: TextStyle(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: TextField(
                              onChanged: (value) {

                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "techblog@gmail.com",
                              ),
                            ),
                          ),
                          ElevatedButton(onPressed: () {

                          }, child: Text("ادامه"))
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("بزن بریم")),
        ],
      ),
    );
  }
}
