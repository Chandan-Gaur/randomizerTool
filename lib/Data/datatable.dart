import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataTablePage extends HookConsumerWidget {
  const DataTablePage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).dividerColor.withAlpha(10),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Data Table'),
        elevation: 0,
      ),
      body: const Column(
        children: [
          Text('Data Table'),
        ],
      ),
    );
  }
}
