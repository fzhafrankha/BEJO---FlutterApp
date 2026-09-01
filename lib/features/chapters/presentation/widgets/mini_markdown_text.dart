import 'package:flutter/material.dart';

/// Renderer teks minimal untuk body materi chapter (`docs/DATA_MODELS.md`:
/// "Markdown-lite: bold/italic/list didukung") — cukup untuk `**bold**`,
/// `*italic*`, dan baris berawalan `- ` sebagai bullet. Bukan markdown penuh.
class MiniMarkdownText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const MiniMarkdownText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? DefaultTextStyle.of(context).style;
    final lines = text.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        if (line.startsWith('- ')) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: baseStyle),
                Expanded(child: _RichLine(line.substring(2), baseStyle)),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: _RichLine(line, baseStyle),
        );
      }).toList(),
    );
  }
}

class _RichLine extends StatelessWidget {
  final String line;
  final TextStyle baseStyle;
  const _RichLine(this.line, this.baseStyle);

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];
    final pattern = RegExp(r'\*\*(.+?)\*\*|\*(.+?)\*');
    var lastEnd = 0;
    for (final match in pattern.allMatches(line)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: line.substring(lastEnd, match.start), style: baseStyle));
      }
      if (match.group(1) != null) {
        spans.add(TextSpan(
          text: match.group(1),
          style: baseStyle.copyWith(fontWeight: FontWeight.bold),
        ));
      } else {
        spans.add(TextSpan(
          text: match.group(2),
          style: baseStyle.copyWith(fontStyle: FontStyle.italic),
        ));
      }
      lastEnd = match.end;
    }
    if (lastEnd < line.length) {
      spans.add(TextSpan(text: line.substring(lastEnd), style: baseStyle));
    }
    return RichText(text: TextSpan(children: spans));
  }
}
