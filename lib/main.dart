import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': " A train travelling at a speed of 75 mph enters a tunnel 31/2 miles long. The train is 1/4 mile long. How long does it take for the train to pass through the tunnel from the moment the front enters to the moment the rear emerges?",
      'answers': [
        {'text': '2.5 min', 'score': 4},
        {'text': '3 min', 'score': 2},
        {'text': '3.2 min', 'score': 3},
        {'text': '3.5 min', 'score': 1},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "A goods train runs at the speed of 72 kmph and crosses a 250 m long platform in 26 seconds. What is the length of the goods train?",
      'answers': [
        {'text': '230 m', 'score': 1},
        {'text': '240 m', 'score': 4},
        {'text': '260 m', 'score': 2},
        {'text': '270 m', 'score': 3},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Which of the following concepts means determining at runtime what method to invoke?",
      'answers': [
        {'text': 'Data hiding', 'score': 4},
        {'text': 'Dynamic Typing', 'score': 2},
        {'text': 'Dynamic binding', 'score': 1},
        {'text': 'All', 'score': 3},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Catching the earlier train will give us the ...... to do some shopping.",
      'answers': [
        {'text': 'chance', 'score': 2},
        {'text': 'luck', 'score': 3},
        {'text': 'possibility', 'score': 4},
        {'text': 'occasion', 'score': 1},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Which cannot directly cause a thread to stop executing?",
      'answers': [
        {'text': 'Calling the SetPriority() method on a Thread object.', 'score': 1},
        {'text': 'Calling the wait() method on an object.', 'score': 4},
        {'text': 'Calling notify() method on an object.', 'score': 1},
        {'text': 'Calling read() method on an InputStream object.', 'score': 4},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "What's your favorite food?",
      'answers': [
        {'text': 'Pizza', 'score': 1},
        {'text': 'Burgers', 'score': 1},
        {'text': 'Hot Pot', 'score': 1},
        {'text': 'Tacos', 'score': 1},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Who do you find most attractive?",
      'answers': [
        {'text': 'Scarlett Johannson', 'score': 3},
        {'text': 'Ryan Reynolds', 'score': 4},
        {'text': 'Tessa Thompson', 'score': 1},
        {'text': 'Gal Gadot', 'score': 2},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Which movie genre do you like the most?",
      'answers': [
        {'text': 'Comedy', 'score': 3},
        {'text': 'Drama', 'score': 4},
        {'text': 'Sci-Fi', 'score': 1},
        {'text': 'Action', 'score': 2},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Which country would you most like to travel to?",
      'answers': [
        {'text': 'Costa Rica', 'score': 3},
        {'text': 'France', 'score': 4},
        {'text': 'Australia', 'score': 1},
        {'text': 'Japan', 'score': 2},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Which video game franchise do you like the most?",
      'answers': [
        {'text': 'Assassin\'s Creed', 'score': 3},
        {'text': 'Call of Duty', 'score': 4},
        {'text': 'Halo', 'score': 1},
        {'text': 'Mass Effect', 'score': 2},
        {'text': 'None of the above', 'score': 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
