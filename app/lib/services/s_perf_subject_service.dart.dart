import 'package:app/model/subject.dart';

class SubjectService {
  // Ders ID'sine göre konuları döndüren fonksiyon
  Future<List<Subject>> fetchSubjectsByLesson(String lessonId) async {
    // lessonId'ye göre subject verileri
    Map<String, List<Subject>> subjectData = {
      '1': [
        Subject(id: '1', name: 'Geometri', successRate: 85.0, correctAnswers: 40, wrongAnswers: 5),
        Subject(id: '2', name: 'Cebir', successRate: 90.0, correctAnswers: 45, wrongAnswers: 3),
      ],
      '2': [
        Subject(id: '3', name: 'Kimyasal bileşikler', successRate: 78.0, correctAnswers: 35, wrongAnswers: 8),
        Subject(id: '4', name: 'hayvanlar alemi', successRate: 83.0, correctAnswers: 40, wrongAnswers: 6),
      ],
      '3': [
        Subject(id: '5', name: 'osmanlı', successRate: 88.0, correctAnswers: 38, wrongAnswers: 4),
        Subject(id: '6', name: 'kayaçlar', successRate: 92.0, correctAnswers: 43, wrongAnswers: 2),
      ],
      '4': [
        Subject(id: '7', name: 'görelilik teorisi', successRate: 75.0, correctAnswers: 33, wrongAnswers: 7),
        Subject(id: '8', name: 'molar ', successRate: 82.0, correctAnswers: 38, wrongAnswers: 5),
      ],
      
    };

    return subjectData[lessonId] ?? [];
  }
}

