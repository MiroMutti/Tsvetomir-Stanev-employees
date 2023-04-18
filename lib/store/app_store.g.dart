// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$winnerProjectAtom =
      Atom(name: '_AppStore.winnerProject', context: context);

  @override
  Project? get winnerProject {
    _$winnerProjectAtom.reportRead();
    return super.winnerProject;
  }

  @override
  set winnerProject(Project? value) {
    _$winnerProjectAtom.reportWrite(value, super.winnerProject, () {
      super.winnerProject = value;
    });
  }

  late final _$errorAtom = Atom(name: '_AppStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadedAtom = Atom(name: '_AppStore.loaded', context: context);

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  late final _$allRecordsAtom =
      Atom(name: '_AppStore.allRecords', context: context);

  @override
  List<Person> get allRecords {
    _$allRecordsAtom.reportRead();
    return super.allRecords;
  }

  @override
  set allRecords(List<Person> value) {
    _$allRecordsAtom.reportWrite(value, super.allRecords, () {
      super.allRecords = value;
    });
  }

  late final _$allTeamsAtom =
      Atom(name: '_AppStore.allTeams', context: context);

  @override
  List<Project> get allTeams {
    _$allTeamsAtom.reportRead();
    return super.allTeams;
  }

  @override
  set allTeams(List<Project> value) {
    _$allTeamsAtom.reportWrite(value, super.allTeams, () {
      super.allTeams = value;
    });
  }

  late final _$winnerProjectsAtom =
      Atom(name: '_AppStore.winnerProjects', context: context);

  @override
  List<Project> get winnerProjects {
    _$winnerProjectsAtom.reportRead();
    return super.winnerProjects;
  }

  @override
  set winnerProjects(List<Project> value) {
    _$winnerProjectsAtom.reportWrite(value, super.winnerProjects, () {
      super.winnerProjects = value;
    });
  }

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void orderedTeamsByDuration() {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.orderedTeamsByDuration');
    try {
      return super.orderedTeamsByDuration();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWinnerProjects() {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.setWinnerProjects');
    try {
      return super.setWinnerProjects();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String e) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setError');
    try {
      return super.setError(e);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWinnerProject() {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.setWinnerProject');
    try {
      return super.setWinnerProject();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCsvRecord(Person record) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.saveCsvRecord');
    try {
      return super.saveCsvRecord(record);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.reset');
    try {
      return super.reset();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTeam(Project project) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.addTeam');
    try {
      return super.addTeam(project);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
winnerProject: ${winnerProject},
error: ${error},
loaded: ${loaded},
allRecords: ${allRecords},
allTeams: ${allTeams},
winnerProjects: ${winnerProjects}
    ''';
  }
}
