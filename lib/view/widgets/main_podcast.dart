import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../components/my_colors.dart';

class MainPodcast extends StatelessWidget {
  final double bodyMargin;
  final int index;
  final double width;
  final double height;
  final String imagePath;
  final String writer;
  final int views;
  final String title;

  const MainPodcast(
      {super.key,
      required this.bodyMargin,
      required this.index,
      required this.width,
      required this.height,
      required this.title,
      required this.views,
      required this.writer,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
      child: Column(
        children: [
          SizedBox(
            height: height / 5.3,
            width: width / 2.5,
            child: Stack(
              children: [
                // Container(
                //   foregroundDecoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover)),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       gradient: LinearGradient(
                //           begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: GradientColors.blogPost)),
                // ),
                CachedNetworkImage(
                  imageUrl: imagePath,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost)));
                  },
                  placeholder: (context, url) {
                    return SpinKitFadingCube(
                      size: 32,
                      color: MyColors.primaryColor,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
                Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          writer,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              '$views',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.white,
                              size: 16,
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
                width: width / 2.4,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
