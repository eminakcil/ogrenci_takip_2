import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ogrenci_takip_2/models/student.dart';
import 'package:ogrenci_takip_2/other/randomPerson.dart';

Student newStudent = Student(
    id: Random().nextInt(99999),
    firstName: RandomPerson().firstName,
    lastName: RandomPerson().lastName,
    grade: RandomPerson().grade);

class AddStudent extends StatefulWidget {
  List<Student> students;
  AddStudent(this.students);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  var formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Ekle'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
                buildFillFormFieldsButton()
              ],
            )),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      controller: _firstNameController,
      decoration: InputDecoration(
          labelText: 'Öğrenci Adı', hintText: newStudent.firstName),
      onSaved: (String value) {
        newStudent.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      controller: _lastNameController,
      decoration: InputDecoration(
          labelText: 'Öğrenci Soyadı', hintText: newStudent.lastName),
      onSaved: (String value) {
        newStudent.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      controller: _gradeController,
      decoration: InputDecoration(
          labelText: 'Öğrenci Notu', hintText: newStudent.grade.toString()),
      onSaved: (String value) {
        newStudent.grade = int.parse(value);
      },
    );
  }

  buildSubmitButton() {
    return RaisedButton(
        onPressed: () {
          formKey.currentState.save();
          widget.students.add(newStudent);
          Navigator.pop(context);
        },
        child: Text('Kaydet'));
  }

  buildFillFormFieldsButton() {
    return RaisedButton(
        onPressed: () {
          setState(() {
            newStudent.firstName = RandomPerson().firstName;
            newStudent.lastName = RandomPerson().lastName;
            newStudent.grade = RandomPerson().grade;

            _firstNameController..text = newStudent.firstName;
            _lastNameController..text = newStudent.lastName;
            _gradeController..text = newStudent.grade.toString();
          });
        },
        child: Text('Doldur'));
  }
}
