import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../../widgets/appbar/appbar_transparent.dart';

class StoryCameraScreen extends StatefulWidget {
  final onClickBackPage;

  StoryCameraScreen({
    required this.onClickBackPage,
  });

  @override
  State<StoryCameraScreen> createState() => _StoryCameraScreenState();
}

class _StoryCameraScreenState extends State<StoryCameraScreen> {
  late CameraController controller;

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      setState(() {});
    }).catchError((Object e) {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
      ),
      body: _buildBody(context),
      backgroundColor: Colors.black,
    );
  }

  _buildBody(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: Stack(
                children: [
                  CameraPreview(controller),
                  _buildShutter(),
                  _buildGallery(),
                  _buildCameraTurn(),
                ],
              ),
            ),
          ),
          _buildClose(),
          _buildFlash(),
        ],
      ),
    );
  }

  _buildClose() {
    return Positioned(
      right: 15,
      top: 15,
      child: GestureDetector(
        onTap: widget.onClickBackPage,
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  _buildFlash() {
    return Positioned(
      left: 15,
      top: 15,
      child: Icon(
        Icons.flash_on,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  _buildGallery() {
    return Positioned(
      bottom: 15,
      left: 15,
      child: Icon(
        Icons.crop_original,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  _buildCameraTurn() {
    return Positioned(
      bottom: 15,
      right: 15,
      child: Icon(
        Icons.sync_sharp,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  _buildShutter() {
    return Positioned(
      bottom: 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
