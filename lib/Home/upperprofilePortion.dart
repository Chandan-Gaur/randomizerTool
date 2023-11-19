import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class homePageUpperPortion extends HookConsumerWidget {
  const homePageUpperPortion({
    super.key,
    required this.wSize,
  });

  final double wSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(left: wSize / 1.53),
        child: Card(
          shadowColor: Theme.of(context).colorScheme.secondary,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListTile(
            leading: const Icon(Icons.mail),
            title: const AutoSizeText(
              'Chandan Gaurjee',
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: const AutoSizeText(
              'chandangaurjecrc@gmail.com',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {},
            trailing: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
        ),
      ),
    );
  }
}
