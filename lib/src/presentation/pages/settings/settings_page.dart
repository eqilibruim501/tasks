import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:tasks/src/app.dart';
import 'package:tasks/src/presentation/shared/widgets/bottom_navigation.dart';
import 'settings_page_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final String route = '/settings';
  // Business Logic Component.
  SettingsPageBloc bloc;
  PackageInfo app;

  /// Called when this state inserted into tree.
  @override
  void initState() {
    super.initState();
    this.bloc = SettingsPageBloc();
    this.app = App.of(this.context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    this.bloc.dispose();
    super.dispose();
  }

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.headerPage(),
      backgroundColor: Colors.white,
      body: this.buildPage(),
      bottomNavigationBar: BottomNavigation(context: context, current: this.route)
    );
  }

  Widget buildPage() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // this.headerPage(),
          this.bodyPage()
        ]
      )
    );
  }

  /// Build header this page.
  Widget headerPage() {
    return AppBar(
      backgroundColor: Colors.grey[400],
      elevation: 0.0,
      title: Text('Settings')
    );
  }

  /// Build body this page.
  Widget bodyPage() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Container(
                    padding: EdgeInsets.symmetric(vertical: 7.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[400],
                          width: 0.5
                        )
                      )
                    ),
                    child: Text(
                      'About',
                      style: Theme.of(context).textTheme.title
                    )
                  )
                ),
                ListTile(
                  title: Text('Version'),
                  trailing: Text(this.app.version),
                ),
                ListTile(
                  title: Text('Third-party software'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {}
                )
              ]
            )
          )
        ),
      )
    );
  }
}
