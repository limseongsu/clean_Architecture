import 'package:clean_architecture/domain/model/photo.dart';
import 'package:flutter/material.dart';

class PhotoModule extends StatelessWidget {
  final Photo photo;

  const PhotoModule({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photo.previewURL),
        ),
      ),
    );
  }
}
