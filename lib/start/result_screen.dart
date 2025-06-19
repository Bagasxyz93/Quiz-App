import 'package:flutter/material.dart';
import 'package:flutter_firstcode/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import '../question_summary/question_summary.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart
  });

  final void Function() onRestart;
  final List<String> chosenAnswer;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> Summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      Summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer':chosenAnswer[i]
      });
    }

    return Summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summarydata.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestion out of $numTotalQuestion question correctly!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 235, 193, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30
            ),
            QuestionSummary(summarydata),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}