<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Employee;

class EmployeeController extends Controller
{
    public function index(){
        $data = Employee::get();
        return response()->json($data);
    }

    public function show($id){
        $data = Employee::find($id);
        return response()->json($data);
    }

    public function store(Request $request){
        $data = Employee::insert([
            'employee_name' => $request->employee_name,
            'employee_age' => $request->employee_age,
            'employee_salary' => $request->employee_salary,
        ]);
        return response()->json($data);   
    }

    public function update(Request $request, $id){
        $data = Employee::find($id)->update([
            'employee_name' => $request->employee_name,
            'employee_age' => $request->employee_age,
            'employee_salary' => $request->employee_salary,
        ]);
        return response()->json($data);   
    }

    public function destroy(Request $request, $id){
        $data = Employee::find($id)->delete();
        return response()->json($data);   
    }
}
