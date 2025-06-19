import 'package:flutter/material.dart';
import 'package:flutter_firstcode/data/questions.dart';
import 'package:flutter_firstcode/start/result_screen.dart';
import '../start/start_screen.dart';
import '../questionPage/question_screen.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Home>{
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
       
        activeScreen = 'result_screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer:choseAnswer
      );  
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswer,
        onRestart: restartQuiz,
      );
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