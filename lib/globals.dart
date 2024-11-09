// Package imports:
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:

Logger logger = Logger();

class App {
  // SharedPreferences 객체를 static으로 선언하여 어디서든 접근 가능하게 함
  static late SharedPreferences localStorage;

  static Future<void> init() async {
    try {
      localStorage = await SharedPreferences.getInstance();
    } catch (e) {
      logger.e("Error initializing SharedPreferences: $e");
    }
  }

  bool didReceiveReward = false;
  // 앱 시작 메서드
  static Future<void> start() async {
    await App.init();
  }
}
