import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpix/application.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(Application());
}
