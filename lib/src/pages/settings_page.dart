import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodapp/src/utils/functions.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List items;

  @override
  void initState() {
    super.initState();
    items = [
//      {
//        'icon': Feather.heart,
//        'title': '',
//        'function': () => _pushPage(Favorites()),
//      },
      {
        'icon': Feather.moon,
        'title': 'Dark Mode',
        'function': () => showAbout(),
      },
      {
        'icon': Feather.info,
        'title': 'About',
        'function': () => showAbout(),
      },
      {
        'icon': Feather.file_text,
        'title': 'Licenses',
        'function': () => _pushPageDialog(LicensePage()),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (items[index]['title'] == 'Dark Mode') {
            return _buildThemeSwitch(items[index]);
          }

          return ListTile(
            onTap: items[index]['function'],
            leading: Icon(
              items[index]['icon'],
            ),
            title: Text(
              items[index]['title'],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Widget _buildThemeSwitch(Map item) {
    return SwitchListTile(
      secondary: Icon(
        item['icon'],
      ),
      title: Text(
        item['title'],
      ),
//      value: Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
//          ? false
//          : true,
    value: false,
//      onChanged: (v) {
//        if (v) {
//          Provider.of<AppProvider>(context, listen: false)
//              .setTheme(ThemeConfig.darkTheme, 'dark');
//        } else {
//          Provider.of<AppProvider>(context, listen: false)
//              .setTheme(ThemeConfig.lightTheme, 'light');
//        }
//      },
    );
  }

  _pushPage(Widget page) {
    Functions.pushPage(
      context,
      page,
    );
  }

  _pushPageDialog(Widget page) {
    Functions.pushPageDialog(
      context,
      page,
    );
  }

  showAbout() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'About',
          ),
          content: Text(
            'Food Delivery App',
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Theme
                  .of(context)
                  .accentColor,
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Close',
              ),
            ),
          ],
        );
      },
    );
  }
}
