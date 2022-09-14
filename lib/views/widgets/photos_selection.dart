import 'package:flutter/material.dart';
import 'package:regms_flutter_client/views/widgets/photo.dart';

class PhotosSelection extends StatelessWidget {
  final photos;

  PhotosSelection({
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 180, minHeight: 180),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        itemCount: photos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Photo(photo: photos[index]);
        },
      ),
    );
  }
}