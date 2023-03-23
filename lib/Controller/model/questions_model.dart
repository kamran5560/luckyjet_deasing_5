class Questions_model {
  List<Questions>? questions;

  void _randomQuestion(){

  }

  Questions_model({this.questions});

  Questions_model.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questions;
  List<String>? incorrectAnswer;
  String? correctAnswer;

  Questions({this.questions, this.incorrectAnswer, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) {
    questions = json['questions'];
    incorrectAnswer = json['incorrect_answer'].cast<String>();
    incorrectAnswer?.add(json['correct_answer']);
    incorrectAnswer?..shuffle();
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questions'] = this.questions;
    data['incorrect_answer'] = this.incorrectAnswer;
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}







class questionlist {
  List<Data>? data;

  questionlist({this.data});

  questionlist.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? coef;
  int? taps;
  int? top;
  int? left;

  Data({this.coef, this.taps, this.top, this.left});

  Data.fromJson(Map<String, dynamic> json) {
    coef = json['coef'];
    taps = json['taps'];
    top = json['top'];
    left = json['left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coef'] = this.coef;
    data['taps'] = this.taps;
    data['top'] = this.top;
    data['left'] = this.left;
    return data;
  }
}