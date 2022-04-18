import 'package:flutter/material.dart';
import 'package:app/service/EmployeeService.dart';
import 'package:app/model/EmployeeModel.dart';

class EmployeeEdit extends StatefulWidget {
  EmployeeEdit(this.employeeModel);
  final EmployeeModel employeeModel;

  @override
  EditDataWidgetState createState() => EditDataWidgetState();
}

class EditDataWidgetState extends State<EmployeeEdit> {
  EditDataWidgetState();

  final EmployeeService api = EmployeeService();
  final _addFormKey = GlobalKey<FormState>();
  int id = 0;
  final employeeNameController = TextEditingController();
  final employeeAgeController = TextEditingController();
  final employeeSalaryController = TextEditingController();

  @override
  void initState(){
    id = widget.employeeModel.id as int;
    employeeNameController.text = widget.employeeModel.employeeName;
    employeeAgeController.text = widget.employeeModel.employeeAge;
    employeeSalaryController.text = widget.employeeModel.employeeSalary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
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
                                      api.updateEmployee(id as int, EmployeeModel(
                                        id: id as int,
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