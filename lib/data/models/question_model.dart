class QuestionModel {
  int index;
  String title;
  List<String> options;
  int selectOptionNum;

  QuestionModel(
      {required this.index,
      required this.options,
      required this.title,
      required this.selectOptionNum});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      index: json['index'] as int,
      title: json['title'] as String,
      options: json['options'] as List<String>,
      selectOptionNum: json['selectOptionNum'] as int
    );
  }
}
