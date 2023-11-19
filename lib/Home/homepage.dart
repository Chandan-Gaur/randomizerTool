// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:randomizer_tool/GetAllData/uploadexcel.dart';

import 'package:randomizer_tool/Home/upperprofilePortion.dart';
import 'package:randomizer_tool/common/customdropdown.dart';

// ignore: must_be_immutable
class HomePage extends HookConsumerWidget {
  HomePage({super.key});
  DateTime? _selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM - y').format(now);
    final formattedDate1 = useState<String>(formattedDate);
    final selectedValue = useState("Gold");
    var wSize = MediaQuery.of(context).size.width;
    var hSize = MediaQuery.of(context).size.height;
    print("width size->>>>$wSize");
    var flexible = Flexible(
      child: Row(
        children: [
          Flexible(
            child: ElevatedButton(
              onPressed: () {
                _onPressed(
                  context: context,
                  formattedDate1: formattedDate1,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                side: BorderSide(
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  formattedDate1.value,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: DropDownWidgetCoustom(
              selectedValue: selectedValue,
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).dividerColor.withAlpha(10),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AutoSizeText('Dashboard'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homePageUpperPortion(wSize: wSize),
          Flexible(
            flex: 9,
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
                      margin: EdgeInsets.only(right: 25, left: 10),
                      child: Container(
                        color: Colors.purple,
                        width: wSize / 1.62,
                        height: hSize / 3.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      UploadExcelModel(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      foregroundColor: Colors.amber,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                      elevation: 10,
                                      shadowColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    child: Text("Generate"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Card(
                          color: Theme.of(context).dividerColor,
                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RecentWinnerWidget(),
                                flexible,
                                SizedBox(
                                  height: 20,
                                ),
                                Flexible(
                                  flex: 9,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shadowColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        child: ListTile(
                                          leading: Icon(MdiIcons.trophy),
                                          title: const AutoSizeText(
                                            'Chandan Gaurjee',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          onTap: () {},
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
// build method ends

  Future<void> _onPressed({
    required BuildContext context,
    required ValueNotifier<String> formattedDate1,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    if (selected != null) {
      _selected = selected;
      formattedDate1.value = DateFormat('MMMM - y').format(selected);
    }
  }

// class ends
}

class RecentWinnerWidget extends StatelessWidget {
  const RecentWinnerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: AutoSizeText(
        'Recent Winniers',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
