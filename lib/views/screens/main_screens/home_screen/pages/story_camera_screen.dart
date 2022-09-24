import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_transparent.dart';

class StoryCameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StoryCameraScreenState();
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
                  _buildEffect(),
                ],
              ),
            ),
          ),
          _buildCameraTurn(),
          _buildFlash(),
        ],
      ),
    );
  }

  _buildShutter() {
    return Positioned(
      bottom: 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCameraTurn() {
    return GestureDetector(
      onTap: () {
      },
      child: Positioned(
        right: 15,
        top: 15,
        child: Icon(
          Icons.sync_sharp,
          color: Colors.white,
          size: 40,
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
        size: 40,
      ),
    );
  }

  _buildGallery() {
    return Positioned(
      left: 15,
      bottom: 15,
      child: Icon(
        Icons.auto_awesome_motion,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  _buildEffect() {
    return Positioned(
      right: 15,
      bottom: 15,
      child: Icon(
        Icons.edit_outlined,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
