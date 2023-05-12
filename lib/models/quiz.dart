class Quiz {
  String question = "";
  bool answer = true;

  Quiz({required this.question, required this.answer});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      question: json['question'],
      answer: json['answer'],
    );
  }
}
