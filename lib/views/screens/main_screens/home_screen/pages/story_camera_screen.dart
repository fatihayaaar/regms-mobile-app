import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/main.dart';

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
    return Container(
      child: _buildCamera(context),
    );
  }

  _buildCamera(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CameraPreview(controller),
    );
  }
}
