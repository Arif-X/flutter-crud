// @dart=2.9

import 'package:flutter/material.dart';
import 'package:app/service/EmployeeService.dart';
import 'package:app/model/EmployeeModel.dart';
import 'package:app/view/employee/EmployeeView.dart';
import 'package:app/view/employee/EmployeeAdd.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hokeh')
    );
  }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({
      Key key,
      this.title
    }) : super(key:key);

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final EmployeeService api = EmployeeService();
  List<EmployeeModel> employeeView;

  @override
  Widget build(BuildContext context){
    if(EmployeeView == null){
      employeeView = List<EmployeeModel>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Hokeh')
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: loadList(),
              builder: (context, snapshot) {
              return employeeView.length > 0 ? new EmployeeView(employee: employeeView) :
                new Center(
                    child: new Text('No data found, tap plus button to add!'),
                );
              }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future loadList(){
    Future<List<EmployeeModel>> futureEmployee = api.getEmployees();
    futureEmployee.then((employeeView){
      setState(() {
        this.employeeView = employeeView;
      });
    });
    return futureEmployee;
  }

  _navigateToAddScreen (BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeAdd()),
    );
  }
}
