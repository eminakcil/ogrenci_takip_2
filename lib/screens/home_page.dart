import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ogrenci_takip_2/models/student.dart';
import 'package:ogrenci_takip_2/other/randomPerson.dart';
import 'package:ogrenci_takip_2/screens/addStudent_page.dart';
import 'package:ogrenci_takip_2/screens/editStudent_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students = [
    Student(
        id: Random().nextInt(99999),
        firstName: RandomPerson().firstName,
        lastName: RandomPerson().lastName,
        grade: RandomPerson().grade),
    Student(
        id: Random().nextInt(99999),
        firstName: RandomPerson().firstName,
        lastName: RandomPerson().lastName,
        grade: RandomPerson().grade),
    Student(
        id: Random().nextInt(99999),
        firstName: RandomPerson().firstName,
        lastName: RandomPerson().lastName,
        grade: RandomPerson().grade)
  ];
  Student _selectedStudent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Öğrenciler')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        '${students[index].firstName} ${students[index].lastName}'),
                    subtitle: Text(
                        'Not: ${students[index].grade} (${students[index].status})'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                    ),
                    trailing: Text('id: ${students[index].id}'),
                    onTap: () {
                      setState(() {
                        this._selectedStudent = students[index];
                      });
                    },
                  );
                }),
          ),
          Text(this._selectedStudent != null
              ? 'Seçili Öğrenci ${_selectedStudent.firstName}'
              : 'Öğrenci Seçilmedi'),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: RaisedButton(
                    color: Colors.greenAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add),
                        SizedBox(width: 5),
                        Text('Ekle')
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddStudent(students)),
                      ).then((res) => setState(() {}));
                      setState(() {});
                    },
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: FlatButton(
                      onPressed: () {
                        if (_selectedStudent != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditStudent(_selectedStudent)),
                          ).then((res) => setState(() {}));
                          setState(() {});
                        }
                      },
                      color: Colors.blueAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.edit),
                          SizedBox(width: 5),
                          Text('Düzenle')
                        ],
                      )),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: FlatButton(
                      onPressed: () {
                        if (this._selectedStudent != null) {
                          int tempStudentIndex = students.indexWhere(
                              (element) => element.id == _selectedStudent.id);
                          if (tempStudentIndex != -1) {
                            setState(() {
                              students.removeAt(tempStudentIndex);
                              _selectedStudent = null;
                            });
                          }
                        }
                      },
                      color: Colors.redAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.delete),
                          SizedBox(width: 5),
                          Text('Sil')
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
