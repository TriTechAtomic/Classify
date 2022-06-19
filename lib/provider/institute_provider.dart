import 'dart:convert';

import 'package:classify/utils/auth/consts.dart';
import 'package:classify/utils/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InstituteProvider with ChangeNotifier {
  Future<List<Teacher>?> getTeachersinstitute(String accessToken) async {
    var data = jsonDecode((await http
            .get(Uri.parse("${baseUrl}getTeachersInInstitute"), headers: {
      "token": accessToken,
    }))
        .body);
    if (data != null) {
      return data.map((e) => Teacher.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Course>?> getCources(String accessToken, courseid) async {
    var data = jsonDecode((await http.get(
            Uri.parse("${baseUrl}getCoursesInInstitute?courceid=$courseid"),
            headers: {
          "token": accessToken,
        }))
        .body);

    if (data != null) {
      return data.map((e) => Course.fromJson(e)).toList();
    }
    return null;
  }

  // Future<List<Teacher>>

  Future<List<Subject>?> getSubjectsInCource(String token) async {
    var data = jsonDecode(
        (await http.get(Uri.parse("${baseUrl}getSubjectsInCourse"), headers: {
      "token": token,
    }))
            .body);
    if (data != null) {
      return data.map((e) => Subject.fromJson(e)).toList();
    }
    return null;
  }

  Future<String?> createTeacherInvite(String accessToken, int teacherId) async {
    var data = jsonDecode((await http.post(
      Uri.parse("${baseUrl}createTeacherInvite"),
      headers: {
        "token": accessToken,
      },
    ))
        .body);
    if (data != null) {
      return data['message'];
    }
    return null;
  }
}

class Subject {
  final int id;
  final int institute_id;
  final String name;
  final String course_id;
  final String teacher_id;

  Subject(
      this.id, this.institute_id, this.name, this.course_id, this.teacher_id);

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      json['id'],
      json['institute_id'],
      json['name'],
      json['course_id'],
      json['teacher_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_id'] = institute_id;
    data['name'] = name;
    data['course_id'] = course_id;
    data['teacher_id'] = teacher_id;
    return data;
  }
}

class Course {
  final int id;
  final int institute_id;
  final String name;
  final String description;
  final int duration;
  final int fees;
  final String start_date;
  final String end_date;
  final String created_at;

  Course(this.id, this.institute_id, this.name, this.description, this.duration,
      this.fees, this.start_date, this.end_date, this.created_at);

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['id'],
      json['institute_id'],
      json['name'],
      json['description'],
      json['duration'],
      json['fees'],
      json['start_date'],
      json['end_date'],
      json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institute_id': institute_id,
      'name': name,
      'description': description,
      'duration': duration,
      'fees': fees,
      'start_date': start_date,
      'end_date': end_date,
      'created_at': created_at,
    };
  }
}
