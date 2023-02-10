// To parse this JSON data, do
//
//     final SolvedExamsModel = SolvedExamsModelFromJson(jsonString);

import 'dart:convert';

// SolvedExamsModel? SolvedExamsModelFromJson(String str) => SolvedExamsModel.fromJson(json.decode(str));
//
// String SolvedExamsModelToJson(SolvedExamsModel? data) => json.encode(data!.toJson());

class SolvedExamsModel {
  SolvedExamsModel({
    this.id,
    this.title,
    this.desc,
    this.examDegree,
    this.answersFile,
    this.questionsFile,
    this.easyQeustionNumber,
    this.easyQeustionDegree,
    this.intermediateQeustionNumber,
    this.intermediateQeustionDegree,
    this.hardQeustionNumber,
    this.hardQeustionDegree,
    this.successDegree,
    this.cost,
    this.duration,
    this.status,
    this.tryNumber,
    this.modelNumber,
    this.monthExam,
    this.must,
    this.homeWork,
    this.lectureId,
    this.studentClassId,
    this.teacherId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? title;
  String? desc;
  String? examDegree;
  dynamic answersFile;
  dynamic questionsFile;
  int? easyQeustionNumber;
  int? easyQeustionDegree;
  int? intermediateQeustionNumber;
  int? intermediateQeustionDegree;
  int? hardQeustionNumber;
  int? hardQeustionDegree;
  int? successDegree;
  int? cost;
  int? duration;
  int? status;
  int? tryNumber;
  int? modelNumber;
  int? monthExam;
  int? must;
  int? homeWork;
  int? lectureId;
  int? studentClassId;
  int? teacherId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  SolvedExamsModel copyWith({
    int? id,
    String? title,
    String? desc,
    String? examDegree,
    dynamic answersFile,
    dynamic questionsFile,
    int? easyQeustionNumber,
    int? easyQeustionDegree,
    int? intermediateQeustionNumber,
    int? intermediateQeustionDegree,
    int? hardQeustionNumber,
    int? hardQeustionDegree,
    int? successDegree,
    int? cost,
    int? duration,
    int? status,
    int? tryNumber,
    int? modelNumber,
    int? monthExam,
    int? must,
    int? homeWork,
    int? lectureId,
    int? studentClassId,
    int? teacherId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      SolvedExamsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        examDegree: examDegree ?? this.examDegree,
        answersFile: answersFile ?? this.answersFile,
        questionsFile: questionsFile ?? this.questionsFile,
        easyQeustionNumber: easyQeustionNumber ?? this.easyQeustionNumber,
        easyQeustionDegree: easyQeustionDegree ?? this.easyQeustionDegree,
        intermediateQeustionNumber: intermediateQeustionNumber ?? this.intermediateQeustionNumber,
        intermediateQeustionDegree: intermediateQeustionDegree ?? this.intermediateQeustionDegree,
        hardQeustionNumber: hardQeustionNumber ?? this.hardQeustionNumber,
        hardQeustionDegree: hardQeustionDegree ?? this.hardQeustionDegree,
        successDegree: successDegree ?? this.successDegree,
        cost: cost ?? this.cost,
        duration: duration ?? this.duration,
        status: status ?? this.status,
        tryNumber: tryNumber ?? this.tryNumber,
        modelNumber: modelNumber ?? this.modelNumber,
        monthExam: monthExam ?? this.monthExam,
        must: must ?? this.must,
        homeWork: homeWork ?? this.homeWork,
        lectureId: lectureId ?? this.lectureId,
        studentClassId: studentClassId ?? this.studentClassId,
        teacherId: teacherId ?? this.teacherId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory SolvedExamsModel.fromJson(Map<String, dynamic> json) => SolvedExamsModel(
    id: json["id"],
    title: json["title"],
    desc: json["desc"],
    examDegree: json["exam_degree"],
    answersFile: json["answers_file"],
    questionsFile: json["questions_file"],
    easyQeustionNumber: json["easy_qeustion_number"],
    easyQeustionDegree: json["easy_qeustion_degree"],
    intermediateQeustionNumber: json["intermediate_qeustion_number"],
    intermediateQeustionDegree: json["intermediate_qeustion_degree"],
    hardQeustionNumber: json["hard_qeustion_number"],
    hardQeustionDegree: json["hard_qeustion_degree"],
    successDegree: json["success_degree"],
    cost: json["cost"],
    duration: json["duration"],
    status: json["status"],
    tryNumber: json["try_number"],
    modelNumber: json["model_number"],
    monthExam: json["month_exam"],
    must: json["must"],
    homeWork: json["home_work"],
    lectureId: json["lecture_id"],
    studentClassId: json["student_class_id"],
    teacherId: json["teacher_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "exam_degree": examDegree,
    "answers_file": answersFile,
    "questions_file": questionsFile,
    "easy_qeustion_number": easyQeustionNumber,
    "easy_qeustion_degree": easyQeustionDegree,
    "intermediate_qeustion_number": intermediateQeustionNumber,
    "intermediate_qeustion_degree": intermediateQeustionDegree,
    "hard_qeustion_number": hardQeustionNumber,
    "hard_qeustion_degree": hardQeustionDegree,
    "success_degree": successDegree,
    "cost": cost,
    "duration": duration,
    "status": status,
    "try_number": tryNumber,
    "model_number": modelNumber,
    "month_exam": monthExam,
    "must": must,
    "home_work": homeWork,
    "lecture_id": lectureId,
    "student_class_id": studentClassId,
    "teacher_id": teacherId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot!.toJson(),
  };
}

class Pivot {
  Pivot({
    this.studentId,
    this.examId,
    this.degree,
    this.status,
    this.time,
    this.createdAt,
    this.updatedAt,
  });

  int? studentId;
  int? examId;
  int? degree;
  int? status;
  String? time;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot copyWith({
    int? studentId,
    int? examId,
    int? degree,
    int? status,
    String? time,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Pivot(
        studentId: studentId ?? this.studentId,
        examId: examId ?? this.examId,
        degree: degree ?? this.degree,
        status: status ?? this.status,
        time: time ?? this.time,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    studentId: json["student_id"],
    examId: json["exam_id"],
    degree: json["degree"],
    status: json["status"],
    time: json["time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "exam_id": examId,
    "degree": degree,
    "status": status,
    "time": time,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
