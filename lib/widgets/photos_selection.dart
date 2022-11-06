import 'package:flutter/material.dart';

import 'photo.dart';

class PhotosSelection extends StatelessWidget {
  final photos;

  const PhotosSelection({
    super.key,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 180, minHeight: 180),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        itemCount: photos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Photo(photo: photos[index]);
        },
      ),
    );
  }
}
