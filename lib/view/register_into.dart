import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/view/cats_screen.dart';
import 'package:validators/validators.dart';
import '../gen/assets.gen.dart';
import '../components/my_texts.dart';

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
            height: 80,
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              MyTexts.welcomeMessage),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, height);
              },
              child: Text(
                MyTexts.letsGo,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
        ],
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16))),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                MyTexts.enterYourEmail,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextField(
                  onChanged: (value) {
                    if (isEmail(value)) {
                      print('email is correct');
                    } else {
                      // validator package which includes is email is used to validate strings
                      print("email is false");
                    }
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: MyTexts.hintEmail,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _activateCodeBottomSheet(context, height);
                  },
                  child: Text(
                    MyTexts.continew,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16))),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                MyTexts.enterActivationCode,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextField(
                  onChanged: (value) {
                    if (isEmail(value)) {
                      print('activation code is correct');
                    } else {
                      // validator package which includes is email is used to validate strings
                      print("activation code is false");
                    }
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "*********",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return MyCats();
                      },
                    ));
                  },
                  child: Text(
                    MyTexts.continew,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ],
          ),
        );
      },
    );
  }
}
