import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/solarized-dark.dart';

final customTheme = Map<String, TextStyle>.from(solarizedDarkTheme)
  ..update('root', (value) => value.copyWith(backgroundColor: Colors.transparent));

class MarkdownRenderer extends StatelessWidget {
  final String source;

  MarkdownRenderer({this.source = ''});

  @override
  Widget build(BuildContext context) {
    final nodes = md.Document(
      inlineSyntaxes: [md.CodeSyntax()],
    ).parseLines(source.split('\n'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: nodes.map((node) {
        if (node is md.Element) {
          print("tag: ${node.tag}");
          switch (node.tag) {
            case 'h1':
              return Container(
                child: SelectableText(node.textContent, style: Theme.of(context).textTheme.headline1),
                margin: EdgeInsets.only(top: 24.0),
              );
            case 'h2':
              return Container(
                child: SelectableText(node.textContent, style: Theme.of(context).textTheme.headline2),
                margin: EdgeInsets.only(top: 24.0),
              );
            case 'p':
              return Container(
                margin: EdgeInsets.only(top: 24.0),
                child: SelectableText(
                  node.textContent,
                  style: Theme.of(context).textTheme.bodyText1
                ),
              );
            case 'pre':
              // Assuming the code is wrapped in a <code> tag inside the <pre> tag
              final codeNode = node.children?.first as md.Element;
              final codeContent = codeNode.textContent ?? '';
              // Extract the language string from the <code> tag's attributes
              final language = codeNode.attributes['class']?.split('language-')?.last;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 9.0),
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Color(0xFF000E13)
                    : Colors.white,
                ),
                child: HighlightView(
                  // Remove all whitespace on the right side.
                  codeContent.trimRight(),
                  language: language ?? 'plaintext', // Use 'plaintext' as a fallback if no language is specified
                  theme: customTheme,
                  textStyle: TextStyle(fontFamily: 'Inconsolata', fontSize: 18),
                ),
              );
            case 'ul':
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    node.children?.map((child) => _buildListItem(context, child))?.toList() ?? [],
              );
            case 'ol':
              var index = 1;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    node.children?.map((child) => _buildOrderedList(context, child, index++))?.toList() ?? [],
              );
            // Add more cases as needed for other element types
          }
        }

        return SizedBox.shrink();  // Fallback for unrecognized node types
      }).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, md.Node node) {
    if (node is md.Element && node.tag == 'li') {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: Theme.of(context).textTheme.bodyText1),
          Expanded(
            child:
                SelectableText(node.textContent, style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildOrderedList(BuildContext context, md.Node node, int index) {
    if (node is md.Element && node.tag == 'li') {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$index. ', style: Theme.of(context).textTheme.bodyText1),
          Expanded(
            child:
                SelectableText(node.textContent, style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }
}
