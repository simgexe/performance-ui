import 'dart:ui';

import 'package:app/viewmodel/s_perf_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/views/performance_page.dart';
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sınıf ve Ders Seçimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Görsel Placeholder
            Container(
              height: 250,
              width: double.infinity,
              child: Center(
                child: Image.asset('assets/grafik.png'),
              ),
            ),
            SizedBox(height: 20),
            ClassAndLessonSelector(),
            SizedBox(height: 80),
            // Performansı Gör Butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerformancePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 89, 69, 98),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
              child: Text('Performansı Gör', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassAndLessonSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectionDropdown(
              hint: 'Sınıfı Seç',
              value: viewModel.selectedClassId,
              items: viewModel.classes.map((classItem) => DropdownMenuItem<String>(
                value: classItem.id,
                child: Text(classItem.name, style: TextStyle(color: Colors.white)),
              )).toList(),
              onChanged: (newValue) {
                viewModel.selectClass(newValue!);
              },
            ),
            SelectionDropdown(
              hint: 'Dersi Seç',
              value: viewModel.selectedLessonId,
              items: viewModel.lessons.map((lesson) => DropdownMenuItem<String>(
                value: lesson.id,
                child: Text(lesson.name, style: TextStyle(color: Colors.white)),
              )).toList(),
              onChanged: (newValue) {
                viewModel.selectLesson(newValue!);
              },
            ),
          ],
        );
      },
    );
  }
}

class SelectionDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;

  SelectionDropdown({
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 169, 144, 187),
        borderRadius: BorderRadius.circular(23.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<String>(
        hint: Text(hint, style: TextStyle(color: Colors.white)),
        value: value,
        dropdownColor: Color.fromARGB(255, 169, 144, 187),
        iconEnabledColor: Colors.white,
        underline: Container(),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
