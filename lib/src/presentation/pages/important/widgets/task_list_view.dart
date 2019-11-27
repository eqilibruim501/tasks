import 'package:flutter/material.dart';
import 'package:tasks/src/core/provider.dart';
import 'package:tasks/src/data/models/task_model.dart';
import 'package:tasks/src/presentation/controllers/tasks_controller_interface.dart';
import 'package:tasks/src/presentation/pages/task/task_page.dart';
import 'package:tasks/src/presentation/shared/widgets/empty_content_box.dart';
import 'package:tasks/src/presentation/shared/widgets/task_list_tile.dart';

import '../important_controller.dart';

class TaskListView extends StatelessWidget {
  /// Create a TaskListView widget.
  TaskListView({
    Key key,
  }): super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    final component = Component.of<ImportantController>(context);
    return StreamBuilder(
      stream: component.tasks,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData && snapshot.data.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                TaskModel item = snapshot.data.elementAt(index);
                return GestureDetector(
                  child: TaskListTile(
                    key: Key(item.id.toString()),
                    data: item,
                    onChanged: (TaskModel model) {
                      component.updateTask(model);
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Component<TasksControllerInterface>.value(
                            value: component,
                            child: TaskPage(model: item),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 0,
                  color: Color(0xff979797),
                );
              },
            );
          } else {
            return EmptyContentBox(
              title: 'no important task created yet',
            );
          }
        }
      },
    );
  }
}
