import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  final String id;
  final String name;
  final double successRate;
  final int correctAnswers;
  final int wrongAnswers;

  Subject({
    required this.id,
    required this.name,
    required this.successRate,
    required this.correctAnswers,
    required this.wrongAnswers,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      successRate: json['successRate'],
      correctAnswers: json['correctAnswers'],
      wrongAnswers: json['wrongAnswers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'successRate': successRate,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
    };
  }

  @override
  List<Object?> get props => [id, name, successRate, correctAnswers, wrongAnswers];
}
