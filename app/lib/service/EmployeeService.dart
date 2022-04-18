import 'dart:convert';

import 'package:app/model/EmployeeModel.dart';
import 'package:http/http.dart';

class EmployeeService {

  final String baseUrl = "http://test.pmiigalileo.or.id";

  Future<List<EmployeeModel>> getEmployees() async {
    final response = await get('$baseUrl/api/employee');
    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<EmployeeModel> employee = body.map((dynamic item) => EmployeeModel.fromJson(item)).toList();
      return employee;
    } else {
      throw "Failed to get data";
    }
  }

  Future<EmployeeModel> getEmployeeById(String id) async {
    final response = await get('$baseUrl/api/employee/$id');

    if (response.statusCode == 200) {
      return EmployeeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<EmployeeModel> createEmployee(EmployeeModel employee) async {
    Map data = {
      'id' : 0,
      'employee_name': employee.employeeName,
      'employee_salary': employee.employeeSalary,
      'employee_age': employee.employeeAge,
    };

    final Response response = await post(
      '$baseUrl/api/employee',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return EmployeeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(data);
    }
  }

  Future<EmployeeModel> updateEmployee(int id, EmployeeModel employee) async {
    Map data = {
      'employee_name': employee.employeeName,
      'employee_salary': employee.employeeSalary,
      'employee_age': employee.employeeAge,
    };

    final Response response = await put(
      '$baseUrl/api/employee/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return EmployeeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(data);
    }
  }

  Future<void> deleteEmployee(int id) async {
    Response res = await delete('$baseUrl/api/employee/$id');

    if (res.statusCode == 200) {
      print("Employee deleted");
    } else {
      throw "Failed to delete a employee.";
    }
  }
}