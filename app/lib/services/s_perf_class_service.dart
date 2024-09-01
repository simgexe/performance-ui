import 'package:app/model/class.dart';

class ClassService {
  Future<List<Class>> fetchClasses() async {
   
    Map<String, List<Class>> classData = {
      '1': [
        Class(
          id: '1',
          name: '1A Sınıfı',
        ),
        Class(
          id: '2',
          name: '1B Sınıfı',
        ),
      ],
      '2': [
        Class(
          id: '3',
          name: '2A Sınıfı',
        ),
        Class(
          id: '4',
          name: '2B Sınıfı',
        ),
      ],
      '3': [
        Class(
          id: '5',
          name: '3A Sınıfı',
        ),
        Class(
          id: '6',
          name: '3B Sınıfı',
        ),
      ],
      
      '4':[
        Class(
          id: '7',
         name: '4A Sınıfı'),
        Class(
          id: '8',
         name: '4B Sınıfı')
      
      ],
    };

    return classData.values.expand((classes) => classes).toList();
  }
}
