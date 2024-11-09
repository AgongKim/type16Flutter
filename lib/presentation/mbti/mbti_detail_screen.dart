import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:type16_project/globals.dart';
import 'package:type16_project/presentation/mbti/components/mbti_one_liner_page.dart';
import 'package:word_cloud/word_cloud.dart';

class MbtiDetailScreen extends StatelessWidget {
  const MbtiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ENTP'),
          bottom: TabBar(
              tabAlignment: TabAlignment.fill,
              isScrollable: false,
              dividerHeight: 1,
              indicatorColor: Color(0xA65C5957),
              indicatorWeight: 2,
              tabs: [
                Tab(
                    height: 48,
                    child: Container(
                      child: Text(
                        '한줄평',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5C5857),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.03,
                        ),
                      ),
                    )),
                Tab(
                    height: 48,
                    child: Text(
                      '정보',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5C5857),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.03,
                      ),
                    )),
                Tab(
                    height: 48,
                    child: Text(
                      '리뷰',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5C5857),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.03,
                      ),
                    )),
              ]),
        ),
        body: TabBarView(children: [
          MbtiOneLinerPage(),
          MbtiOneLinerPage(),
          MbtiOneLinerPage(),
        ]),
      ),
    );
  }
}
