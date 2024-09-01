import 'package:app/model/student.dart';

class StudentService {
  Future<List<Student>> fetchStudentsByClass(String classId) async {
    
    Map<String, List<Student>> studentData = {
      '1': [
        Student(
          id: '1',
          name: 'Ali Veli',
          profileImageUrl: 'https://example.com/profil1.jpg',
          testSuccessRate: 75.0,
        ),
        Student(
          id: '2',
          name: 'Ayşe Fatma',
          profileImageUrl: 'https://example.com/profil2.jpg',
          testSuccessRate: 85.0,
        ),
      ],
      '2': [
        Student(
          id: '3',
          name: 'Mehmet Çetin',
          profileImageUrl: 'https://example.com/profil3.jpg',
          testSuccessRate: 65.0,
        ),
        Student(
          id: '4',
          name: 'Simge Yıldız',
          profileImageUrl: 'https://example.com/profil4.jpg',
          testSuccessRate: 90.0,
        ),
      ],
      '3':[
        Student(id: '5', 
        name: 'Elif Zeynep', 
        profileImageUrl: 'https://example.com/profil5', 
        testSuccessRate:100.0)
      ]


    };

    return studentData[classId] ?? [];
  }
}
