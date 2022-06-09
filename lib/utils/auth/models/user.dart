import 'dart:convert';

import 'package:classify/models/textfield_meta.dart';

class Institute {
  final String username;
  final String password;
  final String institutes_name;
  final String email;
  final String contact;
  final String state;
  final String city;
  final String pincode;
  final String area;
  final int subscription_id;

  Institute(
      this.username,
      this.password,
      this.institutes_name,
      this.email,
      this.contact,
      this.state,
      this.city,
      this.pincode,
      this.area,
      this.subscription_id);

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(
      json['username'].toString(),
      json['password'].toString(),
      json['institutes_name'].toString(),
      json['email'].toString(),
      json['contact'].toString(),
      json['state'].toString(),
      json['city'].toString(),
      json['pincode'].toString(),
      json['area'].toString(),
      int.parse(json['subscription_id']),
    );
  }

  @override
  String toString() {
    return jsonEncode({
      'username': username,
      'password': password,
      'institutes_name': institutes_name,
      'email': email,
      'contact': contact,
      'state': state,
      'city': city,
      'pincode': pincode,
      'area': area,
      'subscription_id': subscription_id,
    });
  }

  factory Institute.fromTFMETA(List<TFmeta> list) {
    return Institute(
      list[0].controller.text,
      list[1].controller.text,
      list[2].controller.text,
      list[3].controller.text,
      list[4].controller.text,
      list[5].controller.text,
      list[6].controller.text,
      (list[7].controller.text),
      list[8].controller.text,
      int.parse(list[9].controller.text),
    );
  }
}

class Teacher {
  final int institute_id;
  final String qualification;
  final String phonenumber;
  final String key_subject;
  final String username;
  final String email;
  final String password;

  Teacher(this.institute_id, this.qualification, this.phonenumber,
      this.key_subject, this.username, this.email, this.password);

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      json['institute_id'] as int,
      json['qualification'] as String,
      json['phonenumber'] as String,
      json['key_subject'] as String,
      json['username'] as String,
      json['email'] as String,
      json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'institute_id': institute_id,
      'qualification': qualification,
      'phonenumber': phonenumber,
      'key_subject': key_subject,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory Teacher.fromTFMETA(List<TFmeta> list) {
    return Teacher(
      int.parse(list[0].controller.text),
      list[1].controller.text,
      list[2].controller.text,
      list[3].controller.text,
      list[4].controller.text,
      list[5].controller.text,
      list[6].controller.text,
    );
  }
}

class Student {
  final int institute_id;
  final int course_id;
  final int age;
  final String gender;
  final String contact;
  final int parent_contact;
  final String address;
  final double total_fees;
  final double pending_fees;
  final int institute_code;
  final String email;
  final String username;
  final String password;
  final String name;

  Student(
      this.institute_id,
      this.course_id,
      this.age,
      this.gender,
      this.contact,
      this.parent_contact,
      this.address,
      this.total_fees,
      this.pending_fees,
      this.institute_code,
      this.email,
      this.username,
      this.password,
      this.name);

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json["institute_id"] as int,
      json["course_id"] as int,
      json["age"] as int,
      json["gender"] as String,
      json["contact"] as String,
      json["parent_contact"] as int,
      json["address"] as String,
      json["total_fees"] as double,
      json["pending_fees"] as double,
      json["institute_code"] as int,
      json["email"] as String,
      json["username"] as String,
      json["password"] as String,
      json["name"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "institute_id": institute_id,
      "course_id": course_id,
      "age": age,
      "gender": gender,
      "contact": contact,
      "parent_contact": parent_contact,
      "address": address,
      "total_fees": total_fees,
      "pending_fees": pending_fees,
      "institute_code": institute_code,
      "email": email,
      "username": username,
      "password": password,
      "name": name,
    };
  }

  factory Student.fromTFMETA(List<TFmeta> list) {
    return Student(
      int.parse(list[0].controller.text),
      int.parse(list[1].controller.text),
      int.parse(list[2].controller.text),
      list[3].controller.text,
      list[4].controller.text,
      int.parse(list[5].controller.text),
      list[6].controller.text,
      double.parse(list[7].controller.text),
      double.parse(list[8].controller.text),
      int.parse(list[9].controller.text),
      list[10].controller.text,
      list[11].controller.text,
      list[12].controller.text,
      list[13].controller.text,
    );
  }
}

class Parent {
  final int studentId;
  final int parentId;

  Parent(this.studentId, this.parentId);

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      json['student_id'] as int,
      json['parent_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'parent_id': parentId,
    };
  }
}
