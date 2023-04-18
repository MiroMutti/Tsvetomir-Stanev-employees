import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:tsvetomir_stanev_employees/models/person.dart';

import '../models/project.dart';

part 'app_store.g.dart';

// ignore: library_private_types_in_public_api
class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  Project? winnerProject;

  @observable
  String error = '';

  @observable
  bool loaded = false;

  @observable
  List<Person> allRecords = <Person>[];

  @observable
  List<Project> allTeams = <Project>[];

  @observable
  List<Project> winnerProjects = <Project>[];

  @action
  void orderedTeamsByDuration() {
    List<Project> orderByDays = allTeams;
    orderByDays.sort(
        (Project a, Project b) => (b.totalDuration).compareTo(a.totalDuration));
    allTeams = orderByDays;
  }

  @action
  void setWinnerProjects() {
    winnerProjects = allTeams
        .where((project) =>
            (project.employeeId1 == winnerProject?.employeeId1 &&
                project.employeeId2 == winnerProject?.employeeId2) ||
            (project.employeeId1 == winnerProject?.employeeId2 &&
                project.employeeId2 == winnerProject?.employeeId1))
        .toList();
    winnerProjects.forEach((element) {
      print(
          'empID1: ${element.employeeId1} // empID2: ${element.employeeId2} // projectID: ${element.projectId} // Duration together: ${element.totalDuration}');
    });
  }

  @action
  setError(String e) => error = e;

  @action
  setWinnerProject() {
    winnerProject = allTeams.first;
  }

  @action
  void saveCsvRecord(Person record) {
    allRecords.add(record);
  }

  @action
  void reset() {
    error = '';
    loaded = false;
    allRecords = <Person>[];
    allTeams = <Project>[];
    winnerProject = null;
  }

  @action
  void addTeam(Project project) {
    allTeams.add(project);
  }
}
