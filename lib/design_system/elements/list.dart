import 'package:flutter/material.dart';

class LUnorderedList extends StatelessWidget {
  final List<String> items;

  LUnorderedList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: Theme.of(context).textTheme.bodyText1),
          Expanded(
            child: SelectableText(item, style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      )).toList(),
    );
  }
}

class LOrderedList extends StatelessWidget {
  final List<String> items;

  LOrderedList({required this.items});

  @override
  Widget build(BuildContext context) {
    var index = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${index++}. ', style: Theme.of(context).textTheme.bodyText1),
          Expanded(
            child: SelectableText(item, style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      )).toList(),
    );
  }
}
