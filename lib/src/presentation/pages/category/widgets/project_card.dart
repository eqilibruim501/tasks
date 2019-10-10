import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks/src/data/models/project_model.dart';
import 'package:tasks/src/presentation/ui_colors.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final double progress;

  const ProjectCard({
    Key key,
    @required this.project,
    @required this.progress
  }): assert(project != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];

    children.add(
      Text(
        this.project.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: UIColors.Blue,
          fontSize: 17.0,
          fontWeight: FontWeight.w600
        )
      )
    );

    if (this.project.description.isNotEmpty) {
      children.add(SizedBox(height: 6.0));
      children.add(
        Text(
          this.project.description,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8)
          )
        )
      );
    }

    children.add(SizedBox(height: 5.0));
    children.add(
      Text(
        'Created: ${DateFormat.yMMMd().format(this.project.created)}',
        style: TextStyle(
          color: Colors.black.withOpacity(0.45)
        )
      )
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.18),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.folder,
                  size: 30.0,
                  color: project.color
                )
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: children
                )
              )
            ]
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Expanded(
                child: LinearProgressIndicator(
                  value: this.progress
                ),
              ),
              SizedBox(width: 10.0),
              Text((progress * 100).round().toString() + '%')
            ],
          )
        ],
      )
    );
  }
}
