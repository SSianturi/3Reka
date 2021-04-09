import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:threereka_tia/login.dart';

List<CameraDescription> cameras;

Future<void> main (async)
{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}