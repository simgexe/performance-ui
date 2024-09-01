


import 'package:get_it/get_it.dart';
import 'services/s_perf_class_service.dart';
import 'services/s_perf_lesson_service.dart';
import 'services/student_service.dart';
import 'services/s_perf_subject_service.dart.dart';
import 'viewmodel/s_perf_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Services
  getIt.registerLazySingleton(() => ClassService());
  getIt.registerLazySingleton(() => LessonService());
  getIt.registerLazySingleton(() => StudentService());
  getIt.registerLazySingleton(() => SubjectService());
  

  // ViewModels
  getIt.registerLazySingleton(() => StudentViewModel());
}
