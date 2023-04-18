import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:tsvetomir_stanev_employees/store/app_store.dart';

import '../models/person.dart';
import '../models/project.dart';

AppStore appStore = AppStore();

Future<void> parseCsvFile(PlatformFile? selectedCsvFile) async {
  List csvList;
  List csvFileContentList = [];
  String csvFileHeaderRowColumnTitles = 'EmpID, ProjectID, DateFrom, DateTo';

  try {
    String s = String.fromCharCodes(selectedCsvFile?.bytes as Iterable<int>);
    // Get the UTF8 decode as a Uint8List
    var outputAsUint8List = Uint8List.fromList(s.codeUnits);
    // split the Uint8List by newline characters to get the csv file rows
    csvFileContentList = utf8.decode(outputAsUint8List).split('\n');
    //print('Selected CSV File contents: ');
    //print(csvFileContentList);

    // Check the column titles and sequence - is the CSV file in the correct template format?
    if (csvFileContentList[0].toString().trim().hashCode !=
        csvFileHeaderRowColumnTitles.hashCode) {
      // CSV file is not in correct format
      //print('CSV file does not seem to have a valid format');
      // appStore.setError('CSV file does not seem to have a valid format');
      //return 'Error: The CSV file does not seem to have a valid format.';
    }

    // Check the column titles and sequence - is the CSV file in the correct template format?
    if (csvFileContentList[0].toString().trim().hashCode !=
        csvFileHeaderRowColumnTitles.hashCode) {
      // CSV file is not in correct format
      //print('CSV file does not seem to have a valid format');
      // appStore.setError('CSV file does not seem to have a valid format');
      // return 'Error: The CSV file does not seem to have a valid format.';
    }

    // check if CSV file has any content - content length > 0?
    if (csvFileContentList.isEmpty || csvFileContentList[1].length == 0) {
      // CSV file does not have content
      print('CSV file has no content');
      appStore.setError('CSV file has no content');
      // return 'Error: The CSV file has no content.';
    }
    // CSV file seems to have a valid format
    // print(
    //   'CSV file has a valid format and has contents, hence proceed to parse...');

// Current First row of the CSV file has column headers - remove it
    // csvFileContentList.removeAt(0);
    // print('Selected CSV File contents after removing the Column Headers: ');

// Remove Duplicate Rows from the CSV File
    csvList = csvFileContentList.toSet().toList();
    // print('CSV file contents after deduplication / removal of duplicates');
    //CSV Files in Array
    //print(csvList);
//Array to class module
    csvList.forEach((csvRow) {
      if (csvRow != null && csvRow.trim().isNotEmpty) {
        // current row has content and is not null or empty
        appStore.saveCsvRecord(Person.fromList(csvRow.split(',')));
      }
    });
    _filterTeams();
  } catch (e) {
    print(e.toString());

    //return 'Error: $e';
  }
}

void _filterTeams() {
  List<Person> data = appStore.allRecords;
//create new collection add pairs of employee with the common project and calculate the days they worked together
  for (int i = 0; i < data.length; i++) {
    for (int j = i + 1; j < data.length; j++) {
      final Person person1 = data[i];
      final Person person2 = data[j];

      if (person1.projectID == person2.projectID) {
        int daysTogether = 0;

        if (person1.dateFrom.isBefore(person2.dateTo) &&
            person1.dateTo.isAfter(person2.dateFrom) &&
            person2.dateFrom.isBefore(person1.dateTo) &&
            person2.dateTo.isAfter(person1.dateFrom)) {
          final DateTime start = person1.dateFrom.isBefore(person2.dateFrom)
              ? person2.dateFrom
              : person1.dateFrom;
          final DateTime end = (person1.dateTo).isBefore(person2.dateTo)
              ? person1.dateTo
              : person2.dateTo;
          Duration diff = end.difference(start);
          if (diff.isNegative) {
            daysTogether = 0;
          } else {
            daysTogether = diff.inDays;
          }
        }

        final Project project = Project(
            employeeId1: person1.empID,
            employeeId2: person2.empID,
            projectId: person1.projectID,
            totalDuration: daysTogether);

        appStore.addTeam(project);
      }
    }
  }
  appStore.orderedTeamsByDuration();
  appStore.setWinnerProject();
  appStore.setWinnerProjects();
}
