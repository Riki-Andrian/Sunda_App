import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/hasil.dart';
import 'package:sunda_app/data/model/quiz.dart';
import 'package:sunda_app/helper/boxes.dart';

class QuizPage extends StatefulWidget {
  final Level level;

  const QuizPage({Key? key, required this.level}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final PageController _controller;
  int pageCounter = 1;
  Color _textColor = Colors.black;
  late List<int> _selectedOptionIndexList;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _selectedOptionIndexList =
        List.generate(widget.level.questions.length, (index) => -1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Card(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromARGB(255, 91, 225, 97),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                        '${pageCounter.toString()} / ${widget.level.questions.length}',
                        style: TextStyle(
                          color: Colors.white
                        ),),
                        
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.level.questions.length,
              itemBuilder: (context, index) {
                return _buildQuestion(widget.level.questions[index], index);
              },
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      textStyle: TextStyle(
                        fontSize: 16,
                      )),
                  child: Text('Sebelumnya'),
                  onPressed: () {
                    if (pageCounter != 1) {
                      pageCounter--;
                    }
                    _controller.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
            
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      textStyle: TextStyle(
                        fontSize: 16,
                      )),
                  child: pageCounter != widget.level.questions.length
                      ? const Text("Selanjutnya")
                      : const Text("Submit"),
                  onPressed: () {
                    if (pageCounter != widget.level.questions.length) {
                      pageCounter++;
                    } else {
                      _submitQuiz();
                      Navigator.of(context).pop();
                    }
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
            
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQuestion(Question question, int pageIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Card(
            margin: EdgeInsets.all(8),
            child: Center(child: Text(question.question)),
          ),
        ),
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: question.options.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: RadioListTile(
                    title: Text(
                      question.options[index].option,
                      style: TextStyle(color: _textColor, fontSize: 16),
                    ),
                    value: index,
                    groupValue: _selectedOptionIndexList[pageIndex],
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOptionIndexList[pageIndex] = value!;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _submitQuiz() async {
    int score = 0;
    List<String> questions = [];
    List<String> selectedAnswers = [];
    List<bool> isCorrect = [];

    for (int i = 0; i < widget.level.questions.length; i++) {
      questions.add(widget.level.questions[i].question);
      selectedAnswers.add(widget
          .level.questions[i].options[_selectedOptionIndexList[i]].option);
      bool correct = widget
          .level.questions[i].options[_selectedOptionIndexList[i]].isCorrect;
      isCorrect.add(correct);
      if (correct) {
        score++;
      }
    }

    var hasil = Hasil(
      level: widget.level.level,
      score: score,
      questions: questions,
      selectedAnswers: selectedAnswers,
      isCorrect: isCorrect,
    );

    await boxHasil.add(hasil);

  }
}
