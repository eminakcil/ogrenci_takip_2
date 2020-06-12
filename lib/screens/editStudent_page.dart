import 'package:flutter/material.dart';
import 'package:ogrenci_takip_2/models/student.dart';

class EditStudent extends StatefulWidget {
  Student student;
  EditStudent(this.student);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  var formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _gradeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Düzenle'),
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
                buildSubmitButton()
              ],
            )),
      ),
    );
  }

  buildFirstNameField() {
    _firstNameController = TextEditingController()..text = widget.student.firstName;
    return TextFormField(
      controller: _firstNameController,
      decoration: InputDecoration(labelText: 'Öğrenci Adı', hintText: widget.student.firstName),
      onSaved: (String value) {
        widget.student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    _lastNameController = TextEditingController()..text = widget.student.lastName;
    return TextFormField(
      controller: _lastNameController,
      decoration:
          InputDecoration(labelText: 'Öğrenci Soyadı', hintText: widget.student.lastName),
      onSaved: (String value) {
        widget.student.lastName = value;
      },
    );
  }

  buildGradeField() {
    _gradeController = TextEditingController()..text = widget.student.grade.toString();
    return TextFormField(
      controller: _gradeController,
      decoration: InputDecoration(labelText: 'Öğrenci Notu', hintText: widget.student.grade.toString()),
      onSaved: (String value) {
        widget.student.grade = int.parse(value);
      },
    );
  }

  buildSubmitButton() {
    return RaisedButton(
        onPressed: () {
          formKey.currentState.save();
          Navigator.pop(context);
        },
        child: Text('Kaydet'));
  }
}
