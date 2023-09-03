import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import './design_system/design_system.dart';

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
              return LHeading(text: node.textContent, level: 1);

            case 'h2':
              return LHeading(text: node.textContent, level: 2);

            case 'h3':
              return LHeading(text: node.textContent, level: 3);

            case 'h4':
              return LHeading(text: node.textContent, level: 4);

            case 'h5':
              return LHeading(text: node.textContent, level: 5);

            case 'h6':
              return LHeading(text: node.textContent, level: 6);

            case 'p':
              return LParagraph(text: node.textContent);

            case 'pre':
              final codeNode = node.children?.first as md.Element;
              final codeContent = codeNode.textContent ?? '';
              final language = codeNode.attributes['class']?.split('language-')?.last;
              return LCodeBlock(content: codeContent, language: language);

            case 'ul':
              final items = node.children?.map((child) => child.textContent)?.toList() ?? [];
              return LUnorderedList(items: items);

            case 'ol':
              final items = node.children?.map((child) => child.textContent)?.toList() ?? [];
              return LOrderedList(items: items);

            case 'blockquote':
              return LBlockquote(text: node.textContent);

            case 'hr':
              return LDivider();
          }
        }
        return SizedBox.shrink();  // Fallback for unrecognized node types
      }).toList(),
    );
  }
}
