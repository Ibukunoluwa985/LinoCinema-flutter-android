import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linocinema/services/app_theme_provider.dart';
import 'package:linocinema/ui/screens/settings/license_screen.dart';
import 'package:linocinema/ui/screens/settings/privacy_policy_screen.dart';
import 'package:linocinema/ui/screens/settings/terms_of_service_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  final DarkThemeProvider theme;

  const Settings({Key key, this.theme}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  DarkThemeProvider _theme;

  @override
  void initState() {
    super.initState();
    _theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 56.0),
        child: Container(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: SettingsList(
          backgroundColor: Colors.transparent,
          sections: [
            SettingsSection(
              title: 'Languages preferences',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                  onPressed: (context) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              elevation: 16,
                              titleTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              contentTextStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.black,
                              title: Text('LANGUAGE'),
                              content: Text(
                                "LinoCinema only offers English as it's Language preferences.",
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Themes',
              tiles: [
                SettingsTile(
                  title: 'Dark theme',
                  subtitle: 'dark gray',
                  leading: Icon(Icons.nights_stay),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                  // ignore: deprecated_member_use
                  onTap: () => {
                    _theme.setDarkMode(),
                  },
                ),
                SettingsTile(
                  title: 'Light theme',
                  subtitle: 'white',
                  leading: Icon(Icons.wb_sunny),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                  // ignore: deprecated_member_use
                  onTap: () => {
                    _theme.setLightMode(),
                  },
                ),
              ],
            ),
            // SettingsSection(
            //   title: 'Account',
            //   tiles: [
            //     SettingsTile(title: 'Email', leading: Icon(Icons.email)),
            //     SettingsTile(title: 'Sign out', leading: Icon(Icons.logout)),
            //   ],
            // ),
            SettingsSection(
              title: 'Usage',
              tiles: [
                SettingsTile(
                  title: 'Terms of Service',
                  leading: Icon(Icons.description),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                  onPressed: (context) => {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 700),
                            type: PageTransitionType.rightToLeftWithFade,
                            child: TermsOfService())),
                  },
                ),
                SettingsTile(
                  title: 'Privacy Policy',
                  leading: Icon(Icons.privacy_tip),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                  onPressed: (context) => {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 700),
                            type: PageTransitionType.rightToLeftWithFade,
                            child: PrivacyPolicy())),
                  },
                ),
                SettingsTile(
                  title: 'Open source license',
                  leading: Icon(Icons.verified),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                  onPressed: (context) => {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 700),
                            type: PageTransitionType.rightToLeftWithFade,
                            child: License())),
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Creator',
              tiles: [
                SettingsTile(
                  title: 'Powered by El-nino',
                  leading: Icon(Icons.create),
                  titleTextStyle: TextStyle(fontSize: 14.0),
                  subtitleTextStyle: TextStyle(fontSize: 10.0),
                ),
                SettingsTile(
                  title: 'Version 1.0.0',
                  titleTextStyle: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
