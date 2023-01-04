import 'package:dark_mode/cunter.dart';
import 'package:dark_mode/faceid/local_auth.dart';
import 'package:dark_mode/font_controller.dart';
import 'package:dark_mode/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

List ls_font = ['', 'Angkor', 'Rub', 'Pac'];

class dark extends StatefulWidget {
  const dark({super.key});

  @override
  State<dark> createState() => _darkState();
}

class _darkState extends State<dark> {
  final theme = GetStorage();
  final theme_2 = GetStorage();

  var locale_us = const Locale('en', 'US');
  var locale_kh = const Locale('en', 'kh');
  @override
  Widget build(BuildContext context) {
    theme.writeIfNull('Darkmode', false);
    bool isdarkmode_1 = theme.read('Darkmode');

    theme_2.writeIfNull('lang', false);
    bool c = theme_2.read('lang');

    FontsController controller = Get.put(FontsController());
    int selectIndex = 0;

    //figer print
    final LocalAuthentication auth = LocalAuthentication();
    _SupportState _supportState = _SupportState.unknown;
    String _authorized = 'Not Authorized';
    bool isAuthenticating = false;
    //figer print
    @override
    void initState() {
      super.initState();
      auth.isDeviceSupported().then((value) => (bool isSupported) => setState(
          () => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported));
    }

    void _authenicate() async {
      bool authenticated = false;

      try {
        setState(() {
          isAuthenticating = true;
          _authorized = 'Authenticating';
        });
        authenticated = await auth.authenticate(
            localizedReason: 'Let OS Determine authentication method',
            options:
                AuthenticationOptions(stickyAuth: true, biometricOnly: true));
        setState(() {
          isAuthenticating = false;
        });
      } on PlatformException catch (e) {
        setState(() {
          isAuthenticating = false;
          _authorized = 'Error -${e.message}';
        });
        return;
      }
      if (!mounted) {
        return;
      }
      setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized',
      );
    }

    return GetBuilder<FontsController>(
        init: controller,
        builder: (contexts) {
          return Scaffold(
            appBar: AppBar(
                // title: Text('$ii'),
                ),
            body: Column(
              children: [
                ListTile(
                  leading: Icon(isdarkmode_1 == false
                      ? Icons.light_mode
                      : Icons.dark_mode),
                  title: Text(
                    isdarkmode_1 == false ? 'Light Mode' : 'Dark Mode',
                    style: TextStyle(fontFamily: controller.fontData),
                  ),
                  trailing: CupertinoSwitch(
                      value: isdarkmode_1,
                      onChanged: (Value) {
                        setState(() {
                          isdarkmode_1 = Value;
                        });
                        isdarkmode_1
                            ? Get.changeTheme(ThemeData.dark())
                            : Get.changeTheme(ThemeData.light());
                        theme.write('Darkmode', Value);
                      }),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(
                    'ភាសាខ្មែរ/English',
                    style: TextStyle(fontFamily: controller.fontData),
                  ),
                  trailing: CupertinoSwitch(
                    value: c,
                    onChanged: (value) {
                      setState(() {
                        c = value;
                      });
                      if (c == false) {
                        Get.updateLocale(locale_us);
                      } else {
                        Get.updateLocale(locale_kh);
                      }
                      theme_2.write('lang', value);
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.font_download),
                  title: Text(
                    'Fonts',
                    style: TextStyle(fontFamily: controller.fontData),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        // change(0);
                                        // theme_2.write('font', ls_font[0]);
                                        controller.changeFonts(0);
                                        Navigator.pop(context);
                                      },
                                      leading: const Icon(Icons.language),
                                      title: const Text(
                                        'Simple',
                                        style: TextStyle(fontFamily: ''),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        // change(1);
                                        controller.changeFonts(1);
                                        Navigator.pop(context);
                                        // theme_font.write('font', ls_font[1]);
                                        // pro.Get(ls_font[1]);
                                      },
                                      leading: const Icon(Icons.language),
                                      title: const Text(
                                        'Angkor',
                                        style: TextStyle(fontFamily: 'Angkor'),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        // change(2);
                                        // theme_font.write('font', ls_font[2]);
                                        controller.changeFonts(2);

                                        Navigator.pop(context);
                                        // pro.Get(ls_font[2]);
                                      },
                                      leading: const Icon(Icons.language),
                                      title: const Text(
                                        'Rub',
                                        style: TextStyle(fontFamily: 'Rub'),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        // change(3);
                                        // theme_font.write('font', ls_font[3]);
                                        controller.changeFonts(3);
                                        Navigator.pop(context);
                                        // pro.Get(ls_font[3]);
                                      },
                                      leading: const Icon(Icons.language),
                                      title: const Text(
                                        'Pac',
                                        style: TextStyle(fontFamily: 'Pac'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.arrow_right)),
                ),
                ListTile(
                  onTap: () {},
                  trailing: IconButton(
                      onPressed: () {
                        final controller = InputController();
                        screenLockCreate(
                          context: context,
                          inputController: controller,
                          onConfirmed: (matchedText) =>
                              Navigator.of(context).pop(),
                          footer: TextButton(
                            onPressed: () {
                              // Release the confirmation state and return to the initial input state.
                              controller.unsetConfirmed();
                            },
                            child: const Text('Reset input'),
                          ),
                        );
                      },
                      icon: Icon(Icons.touch_app)),
                  leading: const Icon(Icons.password),
                  title: Text(
                    'Password',
                    style: TextStyle(fontFamily: controller.fontData),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.fingerprint),
                  title: Text(
                    'Figer Print',
                    style: TextStyle(fontFamily: font_controller.fontData),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        _authenicate();
                      },
                      icon: Icon(Icons.touch_app)),
                ),
                const SizedBox(
                  height: 100,
                ),
                Divider(
                  color: Colors.greenAccent[400],
                  thickness: 3,
                ),
                Text(
                  'English'.tr,
                  style: TextStyle(
                    fontFamily: controller.fontData,
                    fontSize: 30,
                  ),
                ),
                Text('hello'),
              ],
            ),
          );
        });
  }
}

Future<void> localAuth(BuildContext context) async {
  final localAuth = LocalAuthentication();
  final didAuthenticate = await localAuth.authenticate(
    localizedReason: 'Please authenticate',
    // biometricOnly: true,
  );
  if (didAuthenticate) {
    Navigator.pop(context);
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
