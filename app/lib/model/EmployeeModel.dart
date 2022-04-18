class EmployeeModel {
  final int id;
  final String employeeName;
  final String employeeSalary;
  final String employeeAge;

  EmployeeModel({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] as int,
      employeeName: json['employee_name'] as String,
      employeeSalary: json['employee_salary'] as String,
      employeeAge: json['employee_age'] as String,
    );
  }

  @override
  String toString() {
    return 'Employee{'
        'id: $id,'
        'employee_name: $employeeName,'
        'employee_salary: $employeeSalary,'
        'employee_age: $employeeAge'
        '}';
  }
}