
import 'package:app/model/class.dart';
import 'package:app/model/lesson.dart';
import 'package:app/model/subject.dart';
import 'package:app/services/s_perf_class_service.dart';
import 'package:app/services/s_perf_lesson_service.dart';
import 'package:app/services/s_perf_subject_service.dart.dart';
import 'package:app/services/student_service.dart';
import 'package:app/setup_locator.dart';
import 'package:flutter/material.dart';
import 'package:app/model/student.dart';


class StudentViewModel extends ChangeNotifier {
  final StudentService _studentService = getIt<StudentService>();
  final LessonService _lessonService = getIt<LessonService>();
  final SubjectService _subjectService = getIt<SubjectService>();
  final ClassService _classService = getIt<ClassService>();

  List<Student> students = [];
  List<Lesson> lessons = [];
  List<Subject> subjects = [];
  List<Class> classes = [];

  String? selectedClassId;
  String? selectedLessonId;
  Student? selectedStudent;

  StudentViewModel() {
    loadClasses();
    loadLessons();
  }

  void loadClasses() async {
    classes = await _classService.fetchClasses();
    notifyListeners();
  }

  void loadLessons() async {
    lessons = await _lessonService.fetchLessons();
    notifyListeners();
  }

  void selectClass(String classId) async {
    selectedClassId = classId;
    students = await _studentService.fetchStudentsByClass(classId);
    notifyListeners();
  }

  void selectLesson(String lessonId) async {
    selectedLessonId = lessonId;
    subjects = await _subjectService.fetchSubjectsByLesson(lessonId);
    notifyListeners();
  }

  void selectStudent(String studentId) {
    selectedStudent = students.firstWhere((student) => student.id == studentId);
    notifyListeners();
  }
}
