import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "Very Good!";
    if (resultScore <= 10 && resultScore > 0) {
      resultText = "Good!";
    } else if (resultScore <= 20 && resultScore > 10) {
      resultText = "Could have done better!";
    } else if (resultScore <= 30 && resultScore > 20) {
      resultText = "Need to improve!";
    } else if (resultScore == 0) {
      resultText = "Better start studying";
    } else {
      resultText = "Come on Bro, Seriously!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text("Restart Quiz", style: TextStyle(color: Colors.white, backgroundColor: Colors.blue),),
            
            onPressed: ()=> resetHandler,
          ),
        ],
      ),
    );
  }
}
