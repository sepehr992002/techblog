import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../components/my_colors.dart';

class HomeScreenPoster extends StatelessWidget {
  final String imagePath;
  final String title;

  const HomeScreenPoster({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imagePath,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: width / 1.25,
              height: height / 4.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imagePath))),
            );
          },
          placeholder: (context, url) {
            return Container(
              alignment: Alignment.center,
              child: SpinKitFadingCube(
                size: 32,
                color: MyColors.primaryColor,
              ),
              width: width / 1.25,
              height: height / 4.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  ),
            );
          },
          errorWidget: (context, url, error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'could not load image',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            );
          },
        ),
        Container(
          width: width / 1.25,
          height: height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: GradientColors.homePosterCoverGradient)),
        ),
        Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(width / 12, 0, width / 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
