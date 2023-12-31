import 'package:ecosofe_app/common/images_paths/images_paths.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({Key? key, required this.path, this.width, this.height})
      : super(key: key);
  final String path;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FadeInImage.assetNetwork(
        image: path,
        fit: BoxFit.cover,
        width: width,
        height: height,
        placeholder: ImagesPaths.noImage,
        placeholderFit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.withOpacity(.3),
          );
        },
        placeholderErrorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.withOpacity(.3),
          );
        },
      ),
    );
  }
}
