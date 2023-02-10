// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

// QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

// String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.id,
    this.title,
    this.image,
    this.answer,
    this.questionTopicId,
    this.questionLevelId,
    this.choices,
  });

  int? id;
  String? title;
  dynamic image;
  String? answer;
  int? questionTopicId;
  int? questionLevelId;
  List<Choice>? choices;

  QuestionModel copyWith({
    int? id,
    String? title,
    dynamic image,
    String? answer,
    int? questionTopicId,
    int? questionLevelId,
    List<Choice>? choices,
  }) =>
      QuestionModel(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        answer: answer ?? this.answer,
        questionTopicId: questionTopicId ?? this.questionTopicId,
        questionLevelId: questionLevelId ?? this.questionLevelId,
        choices: choices ?? this.choices,
      );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    answer: json["answer"],
    questionTopicId: json["question_topic_id"],
    questionLevelId: json["question_level_id"],
    choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "answer": answer,
    "question_topic_id": questionTopicId,
    "question_level_id": questionLevelId,
    "choices": List<dynamic>.from(choices!.map((x) => x.toJson())),
  };
}

class Choice {
  Choice({
    this.id,
    this.choice,
    this.isCorrect,
    this.questionId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? choice;
  int? isCorrect;
  int? questionId;
  dynamic createdAt;
  dynamic updatedAt;

  Choice copyWith({
    int? id,
    String? choice,
    int? isCorrect,
    int? questionId,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Choice(
        id: id ?? this.id,
        choice: choice ?? this.choice,
        isCorrect: isCorrect ?? this.isCorrect,
        questionId: questionId ?? this.questionId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    id: json["id"],
    choice: json["choice"],
    isCorrect: json["is_correct"],
    questionId: json["question_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "choice": choice,
    "is_correct": isCorrect,
    "question_id": questionId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
