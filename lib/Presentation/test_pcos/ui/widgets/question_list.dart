import 'package:flutter/material.dart';
import '../second_question_screen.dart';
import 'question.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({super.key});

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final Map<int, String?> answers = {}; // Stores answers from the first screen

  @override
  Widget build(BuildContext context) {
    final questions = [
      'Have you experienced recent weight gain?',
      'Have you noticed abnormal hair growth?',
      'Have you noticed any skin darkening?',
      'Are you currently dealing with pimples?',
      'Are you experiencing hair loss?',
      'Do you frequently consume fast food?',
      'Do you engage in regular exercise?',
      'Is your menstrual cycle regular?'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Use ListView.builder for efficient list building
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Question(
                  questionNumber: index + 1,
                  questionText: questions[index],
                  groupValue: answers[index + 1], // Track answer for each question
                  onChanged: (value) {
                    setState(() {
                      answers[index + 1] = value;
                    });
                  },
                );
              },
            ),
          ),
          
          // Bottom row with navigation
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0), // Padding at bottom for better spacing
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('1 of 2', style: TextStyle(fontSize: 16)), // Question indicator
                IconButton(
                  onPressed: () {
                    // Pass the answers to the second screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondQuestionScreen(
                          userAnswers: answers, // Pass the answers
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.pink, // Forward navigation icon
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
