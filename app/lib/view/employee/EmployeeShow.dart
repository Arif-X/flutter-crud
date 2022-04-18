import 'package:flutter/material.dart';
import 'package:app/service/EmployeeService.dart';
import 'package:app/view/employee/EmployeeEdit.dart';
import 'package:app/model/EmployeeModel.dart';

class EmployeeShow extends StatefulWidget {
  EmployeeShow(this.employeeModel);
  final EmployeeModel employeeModel;

  @override
  DetailWidgetState createState() => DetailWidgetState();
}

class DetailWidgetState extends State<EmployeeShow> {
  DetailWidgetState();

  final EmployeeService api = EmployeeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 440,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Name:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                        Text(widget.employeeModel.employeeName)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Age:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                        Text(widget.employeeModel.employeeAge)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Salary:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                        Text(widget.employeeModel.employeeSalary)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          splashColor: Colors.red,
                          onPressed: () {
                            navigateToEditScreen(context, widget.employeeModel);
                          },
                          child: Text('Edit', style: TextStyle(color: Colors.white)),
                          color: Colors.blue,
                        ),
                        RaisedButton(
                          splashColor: Colors.red,
                          onPressed: () {
                            confirmDialog();
                          },
                          child: Text('Delete', style: TextStyle(color: Colors.white)),
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  navigateToEditScreen (BuildContext context, EmployeeModel employee) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeEdit(employee)),
    );
  }

  Future<void> confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                api.deleteEmployee(widget.employeeModel.id);
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}