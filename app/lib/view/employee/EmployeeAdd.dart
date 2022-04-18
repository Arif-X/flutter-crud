import 'package:flutter/material.dart';
import 'package:app/service/EmployeeService.dart';
import 'package:app/model/EmployeeModel.dart';

class EmployeeAdd extends StatefulWidget {
  EmployeeAdd();

  @override
  AddDataWidgetState createState() => AddDataWidgetState();
}

class AddDataWidgetState extends State<EmployeeAdd> {
  AddDataWidgetState();

  final EmployeeService api = EmployeeService();
  final _addFormKey = GlobalKey<FormState>();
  final employeeNameController = TextEditingController();
  final employeeAgeController = TextEditingController();
  final employeeSalaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
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
                          Text('Employee Name'),
                          TextFormField(
                            controller: employeeNameController,
                            decoration: const InputDecoration(
                              hintText: 'Employee Name',
                            ),
                            validator: (value) {
                              if (value == "") {
                                return 'Please enter employee name';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Employee Age'),
                          TextFormField(
                            controller: employeeAgeController,
                            decoration: const InputDecoration(
                              hintText: 'Employee Age',
                            ),
                            validator: (value) {
                              if (value == "") {
                                return 'Please enter employee age';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Employee Salary'),
                          TextFormField(
                            controller: employeeSalaryController,
                            decoration: const InputDecoration(
                              hintText: 'Employee Salary',
                            ),
                            validator: (value) {
                              if (value == "") {
                                return 'Please enter employee salary';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              children: <Widget>[
                                RaisedButton(
                                  splashColor: Colors.red,
                                  onPressed: () {
                                    if (_addFormKey.currentState!.validate()) {
                                      _addFormKey.currentState!.save();
                                      api.createEmployee(EmployeeModel(
                                        id: 0,
                                        employeeName: employeeNameController.text,
                                        employeeAge: employeeAgeController.text,
                                        employeeSalary: employeeSalaryController.text,
                                      ));

                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text('Save', style: TextStyle(color: Colors.white)),
                                  color: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}