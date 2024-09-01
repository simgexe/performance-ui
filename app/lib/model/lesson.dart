import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String id;
  final String name;
  final String classId;
 

  Lesson({
    required this.id,
    required this.name,
    required this.classId,

    
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      name: json['name'],
      classId: json['classId'],
      
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'classId': classId,
      
      
    };
  }

  @override
  List<Object?> get props => [id, name,classId ];
}
