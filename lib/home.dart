import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tsvetomir_stanev_employees/models/person.dart';
import 'package:tsvetomir_stanev_employees/utils/file_processing.dart';

import 'models/project.dart';
import 'store/app_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppStore? appStore;
  PlatformFile? selectedFile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appStore = AppStore();
  }

  Future<void> selectCsvFile() async {
    appStore!.reset();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      selectedFile = result.files.first;
    } else {
      selectedFile = null;
    }
    if (selectedFile != null) parseCsvFile(selectedFile);
    appStore?.loaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CSV Parser'),
        titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 43, 216)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: selectCsvFile,
        child: Icon(Icons.upload_rounded),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Center(
            child: Observer(builder: (_) {
              return (!appStore!.loaded)
                  ? Text(
                      'Get data by pick SVG file.',
                      //textAlign: TextAlign.center,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Observer(builder: (context) {
                            return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 8),
                              ),
                              itemCount: appStore?.winnerProjects.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Employee ID #1: ${appStore!.winnerProjects[0]}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "Employee ID #2: ${appStore!.winnerProjects[1]}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "Project ID: ${appStore!.winnerProjects[2]}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "Days worked: ${appStore!.winnerProjects[3]}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          })
                        ]);
            }),
          ),
        ),
      ),
    );
  }
}
