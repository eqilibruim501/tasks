import 'package:flutter/material.dart';

import 'package:tasks/src/core/provider.dart';
import 'package:tasks/src/domain/entities/task_entity.dart';
import 'package:tasks/src/presentation/shared/widgets/empty_content_box.dart';
import 'package:tasks/src/presentation/shared/widgets/task_list_tile.dart';

import 'important_controller.dart';

part 'widgets/page_body.dart';
part 'widgets/page_header.dart';
part 'widgets/task_list_view.dart';

class ImportantPage extends StatefulWidget {
  /// Create a ImportantPage widget.
  ImportantPage({
    Key key,
  }) : super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<ImportantPage> createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  ImportantController controller;

  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    this.controller = ImportantController();
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(ImportantPage old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  /// Build the ImportantPage widget with state.
  @override
  Widget build(BuildContext context) {
    return Provider<ImportantController>.component(
      component: this.controller,
      child: this.buildPage(),
    );
  }

  Widget buildPage() {
    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: null,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                _PageHeader(),
                _PageBody(),
              ],
            ),
          ),
        );
      }
    );
  }
}
