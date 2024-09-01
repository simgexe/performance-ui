
import 'package:app/model/lesson.dart';

class LessonService {
  Future<List<Lesson>> fetchLessons() async {
   
    Map<String, List<Lesson>> lessonData = {
      '1': [
        Lesson(
          id: '1',
          name: 'Matematik',
          classId: '1',
        ),
        Lesson(
          id: '2',
          name: 'Fen Bilgisi',
          classId: '1',
        ),
      ],
      '2': [
        Lesson(
          id: '3',
          name: 'Türkçe',
          classId: '2',
        ),
        Lesson(
          id: '4',
          name: 'Sosyal Bilgiler',
          classId: '2',
        ),
      ],
      '3': [
        Lesson(
          id: '5',
          name: 'İngilizce',
          classId: '3',
        ),
        Lesson(
          id: '6',
          name: 'Müzik',
          classId: '3',
        ),
      ],
      '4':[
        Lesson(
          id: '7',
          name: 'Beden Eğitimi',
          classId: '4'
        ),
        Lesson(
          id: '8',
          name: 'Resim',
          classId: '4'
        )
      ]
    };

    return lessonData.values.expand((lessons) => lessons).toList();
  }
}
