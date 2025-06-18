import 'package:flutter/material.dart';
import 'package:flutter_firstcode/data/questions.dart';
import 'package:flutter_firstcode/result_screen.dart';
import 'start_screen.dart';
import 'question_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswer = [];
  var activeScreen = 'start_screen';
  

  void switchScreen(){
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void choseAnswer(String answer){
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        selectedAnswer = [];
        activeScreen = 'result_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer:choseAnswer);  
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswer,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 100, 41, 201),
                 Color.fromARGB(255, 92, 43, 176),
                 Color.fromARGB(255, 51, 15, 115)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
          ),
          child: screenWidget,
        )
      ),
    );
  }
}