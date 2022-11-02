import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  const PhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(36)),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(photo.previewUrl)),
      ),
      // child: Text(index.toString()),
    );
  }
}
