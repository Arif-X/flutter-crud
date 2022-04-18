import 'package:app/view/employee/EmployeeShow.dart';
import 'package:flutter/material.dart';
import 'package:app/model/EmployeeModel.dart';

class EmployeeView extends StatelessWidget {
  final List<EmployeeModel> employee;

  EmployeeView({
    required Key key,
    required this.employee
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemCount: employee == null ? 0 : employee.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmployeeShow(employee[index])),
                  );
                },
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(employee[index].employeeName),
                    subtitle: Text(employee[index].employeeSalary.toString()),
                  )
              )
          );
        }
    );
  }
}