
import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';

class MbtiOneLinerPage extends StatelessWidget {
  const MbtiOneLinerPage({super.key});

  final String _dummyMbtiData =
      '개인주의 · 자유주의 · 이성적 · 이상주의 · 창의력 · 개성 · 뛰어난 언변 · 직설적 · 브레인스토밍 · 즉흥적 · 낙천적 · 솔직함 · 개방적 사고 · 모험 · 논리적 사고 · 변화와 혁신 · 직관적 사고 · 다원주의 · 자기애 · 독립성 · 독창성 · 몽상가 · 높은 자존감 · 논쟁과 토론 · 객관적 · 융통성 · 공격적 비판 · 스포트라이트 · 재미 · 반항아 기질';


  @override
  Widget build(BuildContext context) {
    final dummyMbtiData = _dummyMbtiData
        .split(' · ')
        .asMap()
        .map((index, e) => MapEntry(index, {'word': e, 'value': index + 1}))
        .values
        .toList();
    WordCloudData mydata = WordCloudData(data: dummyMbtiData);
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 300,
            child: WordCloudView(
              mapcolor: Colors.white,
              attempt: 100,
              data: mydata,
              mapwidth: constraints.maxWidth,
              mapheight: 300,
              colorlist: [Colors.black, Colors.redAccent, Colors.indigoAccent],
              mintextsize: 5,
              maxtextsize: 25,
              shape: WordCloudEllipse(majoraxis: 300.0, minoraxis: 300.0),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('테스트 대사'),
                    subtitle: Text('테스트 부제목'),
                    trailing: Text(dummyMbtiData[index]['value'].toString()),
                  );
                }),
          ),
        ],
      );
    });
  }
}
