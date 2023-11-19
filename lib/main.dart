import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:randomizer_tool/Data/datatable.dart';
import 'package:randomizer_tool/Home/homepage.dart';
import 'package:randomizer_tool/Settings/settfings.dart';
import 'package:randomizer_tool/theme.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  await GetStorage.init();
  sqfliteFfiInit();
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setFullScreen(true);
  await DesktopWindow.setMinWindowSize(const Size(800, 700));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      darkTheme: darktheme,
      themeMode: ThemeMode.dark,
      theme: darktheme,
      home: Scaffold(
        body: Row(
          children: [
            SidebarX(
              controller: _controller,
              theme: SidebarXTheme(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(color: Colors.white),
                selectedTextStyle: const TextStyle(color: Colors.white),
                itemTextPadding: const EdgeInsets.only(left: 30),
                selectedItemTextPadding: const EdgeInsets.only(left: 30),
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 20,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
              ),
              extendedTheme: const SidebarXTheme(
                width: 200,
                margin: EdgeInsets.only(right: 10),
              ),
              footerDivider:
                  Divider(color: Colors.white.withOpacity(0.3), height: 1),
              headerBuilder: (context, extended) {
                return SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                );
              },
              items: const [
                SidebarXItem(
                  icon: Icons.home,
                  label: 'Home',
                ),
                SidebarXItem(
                  icon: Icons.dashboard_outlined,
                  label: 'Data Table',
                ),
                SidebarXItem(
                  icon: Icons.settings,
                  label: 'Settings',
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: _ScreensExample(controller: _controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return HomePage();
          case 1:
            return const DataTablePage();
          case 2:
            return const SettingsPage();
          default:
            return Text(
              'Not found page',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}
