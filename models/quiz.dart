import 'answer.dart';
import 'question.dart';

class Quiz{
  final List<Question> questions;
  final List<Answer> answers = [];

  Quiz({required this.questions});

  void answerQuestion(Answer answer){
    answers.add(answer);
  }

  int getTotalScore(){
    int total = 0;
    for(int i = 0; i < answers.length; i++){
      if(answers[i].isGood(questions[i].goodChoice)){
        total += questions[i].points;
      }
    }
    return total;
  }

  int getPoint(int index){
    if(answers[index].isGood(questions[index].goodChoice)){
      return questions[index].points;
    }
    return 0;
  }


}