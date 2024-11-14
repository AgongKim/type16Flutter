import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:type16_project/globals.dart';
import 'package:type16_project/presentation/base/base_scaffold_navigation.dart';
import 'package:type16_project/routing/app_router.dart';

class PersonalityScreen extends StatelessWidget {
  const PersonalityScreen({super.key});
  static const dummyMbtiModels = {
    'ISTJ': 'ISTJ',
    'ISFJ': 'ISFJ',
    'INFJ': 'INFJ',
    'INTJ': 'INTJ',
    'ISTP': 'ISTP',
    'ISFP': 'ISFP',
    'INFP': 'INFP',
    'INTP': 'INTP',
    'ESTP': 'ESTP',
    'ESFP': 'ESFP',
    'ENFP': 'ENFP',
    'ENTP': 'ENTP',
    'ESTJ': 'ESTJ',
    'ESFJ': 'ESFJ',
    'ENFJ': 'ENFJ',
    'ENTJ': 'ENTJ',
  };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
            crossAxisCount: 4,
          childAspectRatio: (itemWidth / itemHeight),
          shrinkWrap: true,
          children: dummyMbtiModels.keys.map((key) {
            return Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  context.goNamed(AppRoute.personalityDetail.name);
                },
                child: Center(
                  child: Text(
                    key,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}
