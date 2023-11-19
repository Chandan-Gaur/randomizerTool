// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:randomizer_tool/common/customdropdown.dart';

// ignore: must_be_immutable
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = useState<String>("Item1");
    var wSize = MediaQuery.of(context).size.width;
    var hSize = MediaQuery.of(context).size.height;
    print("width size->>>>$wSize");
    return Scaffold(
        backgroundColor: Theme.of(context).dividerColor.withAlpha(10),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const AutoSizeText('Dashboard'),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DropDownWidgetCoustom(
            //   items_list: items_list,
            //   selectedValue: selectedValue,
            // ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: wSize / 1.55),
                child: Card(
                  shadowColor: Theme.of(context).colorScheme.secondary,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListTile(
                    leading: Icon(Icons.mail),
                    title: AutoSizeText(
                      'Chandan Gaurjee',
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: AutoSizeText(
                      'chandangaurjecrc@gmail.com',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {},
                    trailing: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://placehold.co/600x400.png'),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.only(right: 5, left: 50),
                        child: Image.network(
                          'https://placehold.co/600x400.png',
                          width: wSize / 1.62,
                          height: hSize / 3.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Card(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'Recent Winniers',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                DropDownWidgetCoustom(
                                  selectedValue: selectedValue,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
