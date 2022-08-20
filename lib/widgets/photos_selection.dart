import 'package:flutter/material.dart';
import 'package:regms_flutter_client/widgets/photo.dart';

class PhotosSelection extends StatefulWidget {
  final photos;

  PhotosSelection({
    required this.photos,
  });

  @override
  State<StatefulWidget> createState() => _PhotosSelectionState(photos);
}

class _PhotosSelectionState extends State {
  var photos;

  _PhotosSelectionState(this.photos);

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