import 'dart:math';

import 'package:app/model/subject.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/viewmodel/s_perf_viewmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<StudentViewModel>(
          builder: (context, viewModel, child) {
            return Text(viewModel.selectedStudent?.name ?? 'Öğrenci Detayları');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StudentPerformanceChart(),
              SizedBox(height: 20),
              SubjectTestDetails(),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentPerformanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          height: 300,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Başarı Oranı Grafiği'),
            legend: Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              ColumnSeries<Subject, String>(
                dataSource: viewModel.subjects,
                xValueMapper: (Subject subject, _) => subject.name,
                yValueMapper: (Subject subject, _) => subject.successRate,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                pointColorMapper: (Subject, subject) => getRandomColor(),

              ),
            ],
          ),
        );
      },
    );
  }
}

class SubjectTestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentViewModel>(
      builder: (context, viewModel, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: viewModel.subjects.length,
          itemBuilder: (context, index) {
            final subject = viewModel.subjects[index];
            return Card(
              child: ListTile(
                title: Text(subject.name),
                subtitle: Text(
                    'Doğru: ${subject.correctAnswers}  Yanlış: ${subject.wrongAnswers}  Başarı Oranı: ${subject.successRate}%'),
              ),
            );
          },
        );
      },
    );
  }
}

Color getRandomColor(){
  final Random random = Random();
  return Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
 

}