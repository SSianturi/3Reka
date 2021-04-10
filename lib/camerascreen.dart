import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:threereka_tia/tflite.dart';
import 'camerarecog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        camera: firstCamera,
      ),
    ),
  );
}

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin, WidgetsBindingObserver {
  TensorflowService _tensorflowService = TensorflowService();
  CameraService _cameraService = CameraService();

  Future<void> _initializeControllerFuture;

  AppLifecycleState _appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    startUp();
  }

  Future startUp() async {
    if (!mounted) {
      return;
    }
    if (_initializeControllerFuture == null) {
      _initializeControllerFuture = _cameraService.startService(widget.camera).then((value) async {
        await _tensorflowService.loadModel();
        startRecognitions();
      });
    } else {
      await _tensorflowService.loadModel();
      startRecognitions();
    }
  }

  startRecognitions() async {
    try {
      _cameraService.startStreaming();
    } catch (e) {
      print('error streaming camera image');
      print(e);
    }
  }

  stopRecognitions() async {
    await _cameraService.stopImageStream();
    await _tensorflowService.stopRecognitions();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                CameraScreen(
                  controller: _cameraService.cameraController,
                ),
                CameraHeader(),
                Recognition(
                  ready: true,
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycleState = state;
    if (_appLifecycleState == AppLifecycleState.resumed) {
      startUp();
    }
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _tensorflowService.dispose();
    _initializeControllerFuture = null;
    super.dispose();
  }
}