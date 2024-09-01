import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String id;
  final String name;
  final String profileImageUrl;
  final double testSuccessRate;

  Student({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.testSuccessRate,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      testSuccessRate: json['testSuccessRate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'testSuccessRate': testSuccessRate,
    };
  }

  @override
  List<Object?> get props => [id, name, profileImageUrl, testSuccessRate];
}
