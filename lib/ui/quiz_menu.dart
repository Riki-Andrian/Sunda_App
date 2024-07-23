import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/quickjs/ffi.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:Nyunda/data/model/hasil.dart';
import 'package:Nyunda/data/model/quiz.dart';
import 'package:Nyunda/ui/quiz_detail_level.dart';
import 'package:Nyunda/widget/quiz_menu_widget.dart';

class QuizMenu extends StatelessWidget {
  const QuizMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build(context);
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1),
              itemCount: levels.length,
              itemBuilder: (context, index){
                bool isLocked = _isLevelLocked(levels[index].level);
                return GestureDetector(
                  onTap: isLocked 
                  ? null
                  :() {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => QuizDetailLevelPage(level: levels[index]),
                    ));
                  },
                  child: QuizMenuWidget(level: levels[index],isLocked: isLocked),
                );
                
              },
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
    return Quiz.fromJson(jsonDataMap);
  }

   bool _isLevelLocked(int levelNumber) {
    var box = Hive.box<Hasil>('hasilBox');

    if (levelNumber == 1) {
      return false;
    }

    var previousLevelResult = box.values.firstWhereOrNull(
      (hasil) => hasil.level == levelNumber - 1,
    );

    return previousLevelResult == null || previousLevelResult.score == 0;
  }

}
