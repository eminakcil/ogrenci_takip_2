import 'package:flutter/foundation.dart';

class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student(
    {
      @required this.id,
      this.firstName: 'Emin',
      this.lastName: 'AKÇİL',
      this.grade: 100
    });

  String get status {
    String _status = 'Geçersiz';

    if (grade != null) {
      if (grade >= 0 && grade <= 100) {
        if (grade >= 55) {
          _status = 'Geçti';
        } else if (grade >= 40) {
          _status = 'Bütünleme';
        } else {
          _status = 'Kaldı';
        }
      }
    }

    return _status;
  }
}
