import 'package:equatable/equatable.dart';

class Class extends Equatable {
  final String id;
  final String name;

  Class({
    required this.id,
    required this.name,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
