

import 'package:flutter/material.dart';

class PersonalityReviewPage extends StatefulWidget {
  const PersonalityReviewPage({super.key});

  @override
  State<PersonalityReviewPage> createState() => _PersonalityReviewPageState();
}

class _PersonalityReviewPageState extends State<PersonalityReviewPage> {
  String mbti = '전체';
  String sort = '최신순';

  void updateMbti(String value) {
    setState(() {
      mbti = value;
    });
  }
  void updateSort(String value) {
    setState(() {
      sort = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace:Container(
          height: 80,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: DropdownButton(
                    onChanged: (value) => setState(() {
                      mbti = value.toString();
                    }),
                    elevation: 0,
                    underline: Container(),
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: mbti,
                    items: [
                      DropdownMenuItem(
                        value: '전체',
                        child: Text('전체'),
                      ),
                      DropdownMenuItem(
                        value: 'INFP',
                        child: Text('INFP'),
                      ),
                      DropdownMenuItem(
                        value: 'ENFP',
                        child: Text('ENFP'),
                      ),
                      DropdownMenuItem(
                        value: 'INFJ',
                        child: Text('INFJ'),
                      ),
                      DropdownMenuItem(
                        value: 'ENFJ',
                        child: Text('ENFJ'),
                      ),
                      DropdownMenuItem(
                        value: 'INTP',
                        child: Text('INTP'),
                      ),
                      DropdownMenuItem(
                        value: 'ENTP',
                        child: Text('ENTP'),
                      ),
                      DropdownMenuItem(
                        value: 'INTJ',
                        child: Text('INTJ'),
                      ),
                      DropdownMenuItem(
                        value: 'ENTJ',
                        child: Text('ENTJ'),
                      ),
                      DropdownMenuItem(
                        value: 'ISTP',
                        child: Text('ISTP'),
                      ),
                      DropdownMenuItem(
                        value: 'ESTP',
                        child: Text('ESTP'),
                      ),
                      DropdownMenuItem(
                        value: 'ISFP',
                        child: Text('ISFP'),
                      ),
                      DropdownMenuItem(
                        value: 'ESFP',
                        child: Text('ESFP'),
                      ),
                      DropdownMenuItem(
                        value: 'ISTJ',
                        child: Text('ISTJ'),
                      ),
                      DropdownMenuItem(
                        value: 'ESTJ',
                        child: Text('ESTJ'),
                      ),
                      DropdownMenuItem(
                        value: 'ISFJ',
                        child: Text('ISFJ'),
                      ),
                      DropdownMenuItem(
                        value: 'ESFJ',
                        child: Text('ESFJ'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: DropdownButton(
                      onChanged: (value) => setState(() {
                        sort = value.toString();
                      }),
                      elevation: 0,
                      underline: Container(),
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: sort,
                      items: [
                        DropdownMenuItem(
                            value: '최신순',
                            child: Text('최신순')
                        ),
                        DropdownMenuItem(
                            value: '추천순',
                            child: Text('추천순')
                        ),
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.red,
            height: 500,
          ),
          Container(
            color: Colors.amber,
            height: 500,
          )
        ],
      ),
    );
  }
}
