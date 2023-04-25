import 'package:flutter/material.dart';
import 'job_info.dart';

class InputListPage extends StatefulWidget {
  @override
  State<InputListPage> createState() => _InputListPageState();
}

class _InputListPageState extends State<InputListPage> {
  List<JobInfo> _jobList = [];
  TextEditingController _positionController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _deadlineController = TextEditingController();
  TextEditingController _urlController = TextEditingController();

  void _addItemToList() {
    if (_positionController.text.isNotEmpty &&
        _companyController.text.isNotEmpty &&
        _deadlineController.text.isNotEmpty &&
        _urlController.text.isNotEmpty) {
      setState(() {
        _jobList.add(JobInfo(
          position: _positionController.text,
          company: _companyController.text,
          deadline: _deadlineController.text,
          url: _urlController.text,
        ));
        _positionController.clear();
        _companyController.clear();
        _deadlineController.clear();
        _urlController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input List Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _positionController,
                decoration: InputDecoration(
                  labelText: 'Position',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _companyController,
                decoration: InputDecoration(
                  labelText: 'Company',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _deadlineController,
                decoration: InputDecoration(
                  labelText: 'Deadline',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  labelText: 'URL',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _addItemToList,
                child: Text('Add Job Info'),
              ),
              SizedBox(height: 8),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _jobList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${_jobList[index].position} at ${_jobList[index].company}'),
                    subtitle: Text(
                        'Deadline: ${_jobList[index].deadline}\nURL: ${_jobList[index].url}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
