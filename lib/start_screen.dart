import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 320,
            color: Color.fromARGB(170, 255, 255, 255),
          ),

           const SizedBox(height: 100,),
          Text(
            'Learning Flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 233, 213, 255)
            ),
          ),

          const SizedBox(height: 30,),

          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: Icon(Icons.arrow_right_alt_rounded),
            label: const Text('Start Quiz')
          )
        ],
      ),
    );
  }
}