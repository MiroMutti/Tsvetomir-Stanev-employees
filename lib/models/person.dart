import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Person {
  String empID;
  String projectID;
  DateTime dateFrom;
  DateTime dateTo;
  Person(
      {required this.empID,
      required this.projectID,
      required this.dateFrom,
      required this.dateTo});

  // List to class Module
  Person.fromList(List items)
      : this(
            empID: items[0].trim(),
            projectID: items[1].trim(),
            dateFrom: DateTime.parse(items[2].trim()),
            dateTo: DateTime.tryParse(items[3].trim()) ?? DateTime.now());

  // Convert Data to JSON
  Map toJson() {
    return {
      'empID': empID,
      'projectID': projectID,
      'dateFrom': dateFrom,
      'dateTo': dateTo
    };
  }

  // Convert Data to list
  List toList() {
    return [empID, projectID, dateFrom, dateTo];
  }

  // JSON to class Module
  factory Person.fromData(Map data) {
    return Person(
        empID: data['empID'] as String,
        projectID: data['projectID'] as String,
        dateFrom: DateTime.parse(data['dateFrom']),
        dateTo: DateTime.tryParse(data['dateTo']) ?? DateTime.now());
  }
}
