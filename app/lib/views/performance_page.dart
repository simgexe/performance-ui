import 'package:app/model/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/viewmodel/s_perf_viewmodel.dart';
import 'package:app/views/student_details_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<StudentViewModel>(
          builder: (context, viewModel, child) {
            return Text('${viewModel.selectedClassId} Öğrencileri');  
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Syncfusion Chart
            Consumer<StudentViewModel>(
              builder: (context, viewModel, child) {
                return Container(
                  height: 300,
                  padding: EdgeInsets.all(16.0),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    title: ChartTitle(text: 'Ders Başarı Oranları'),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                      ColumnSeries<Student, String>(
                        dataSource: viewModel.students,
                        xValueMapper: (Student student, _) => student.name,
                        yValueMapper: (Student student, _) => student.testSuccessRate,
                        pointColorMapper: (Student student, _) => getRandomColor(),
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                );
              },
            ),
            // Öğrenci Listesi
            Consumer<StudentViewModel>(
              builder: (context, viewModel, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: viewModel.students.length,
                    itemBuilder: (context, index) {
                      final student = viewModel.students[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(student.profileImageUrl),
                          ),
                          title: Text(student.name),
                          subtitle: Text('Başarı Yüzdesi: ${student.testSuccessRate}%'),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            viewModel.selectStudent(student.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentDetailsPage(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Anasayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}



