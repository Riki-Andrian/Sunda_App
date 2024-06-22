import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sunda_app/data/model/quiz.dart';
// import 'package:sunda_app/ui/quiz_detail_level.dart';
import 'package:sunda_app/widget/quiz_menu_widget.dart';

class QuizMenu extends StatelessWidget {
  const QuizMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.replace('/');
          return false;
        },
        child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Quiz>(
      future: readJsonData(),
      builder: (context, AsyncSnapshot<Quiz> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          List<Level> levels = snapshot.data!.levels;
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemCount: levels.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => QuizDetailLevelPage(level: levels[index]),
                //     ));
              },
              child: QuizMenuWidget(level: levels[index]),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  Future<Quiz> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/quiz.json');
    final jsonDataMap = json.decode(jsondata);
    return Quiz.fromJson(jsonDataMap); // Use Quiz.fromJson to parse JSON data
  }
}
