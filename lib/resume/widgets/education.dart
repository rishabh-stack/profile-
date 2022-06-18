import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';



Uuid uuid = const Uuid();

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final _myKey = GlobalKey();

  List<Widget> _educationList = <Widget>[];

  int indexId = 0;

  void addEducation(int index) {
    setState(() {
      _educationList.add(
          ExpansionEducation(
            //section: _educationList[index],
              idx: index,
              onPressed: (int val) {
                log('index: ${val}');
                _educationList.remove(_educationList[val]);
                // log('${_educationList.length}');
                log('$index');
                setState( () => _educationList = _educationList);
              }
          )
      );

    });
  }


  @override
  Widget build(BuildContext context) {




    log('$indexId');



    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Education",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 20.0,
        ),
        Flexible(
          fit: FlexFit.loose,
          child:  ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _educationList.length,
              itemBuilder: (context, index) {
                log('$index');
                return Padding(
                  key: Key(uuid.v4()),
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: _educationList[index],
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 28.0, 0.0),
          child: TextButton.icon(
            onPressed: () {
              addEducation(indexId);
              setState( () => indexId = indexId + 1);
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Education'),
          ),
        )
      ],
    );
  }
}

class ExpansionEducation extends StatefulWidget {
  const ExpansionEducation({
    Key? key,
    //required this.section,
    required this.onPressed,
    required this.idx,
  }) : super(key: key);

  final Function(int) onPressed;
  //final Widget section;
  final int idx;

  @override
  State<ExpansionEducation> createState() => _ExpansionEducationState();
}

class _ExpansionEducationState extends State<ExpansionEducation>with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  TextEditingController schoolController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String school = schoolController.text.trim();
    String degree = degreeController.text.trim();
    String course = courseController.text.trim();

    void deleteEducation(int x) {
      return (widget.onPressed(x));
    }

    return ExpansionTile(
      title: (school == "") ? const Text('Untitled School') : Text(school),
      subtitle: (degree == "")
          ? const Text('Untitled Degree - Untitled Course')
          : Text('$degree - $course'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: schoolController,
                    onChanged: (txt) {
                      setState(() => school = txt);
                    },
                    decoration: const InputDecoration(
                      labelText: "School",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: degreeController,
                    onChanged: (txt) {
                      setState(() => degree = txt);
                    },
                    decoration: const InputDecoration(
                      labelText: "Degree",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: courseController,
                    onChanged: (txt) {
                      setState(() => course = txt);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Course',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    //controller: nameController,
                    decoration: InputDecoration(
                      labelText: "GPA",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 20.0, 0.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          //controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Start Date",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          //controller: nameController,
                          decoration: InputDecoration(
                            labelText: "End Date",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    //controller: nameController,
                    decoration: InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextButton.icon(
          onPressed: () {

            deleteEducation(widget.idx);

          },
          icon: Icon(Icons.delete),
          label: Text("Delete this education"),
        )
      ],
    );
  }
}
