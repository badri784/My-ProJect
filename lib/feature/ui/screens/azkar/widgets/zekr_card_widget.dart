import 'package:flutter/material.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/zekr_card.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/zekr_card_column.dart';

class ZekrCardWidget extends StatelessWidget {
  const ZekrCardWidget({
    super.key,
    required this.widget,
    required this.fontScale,
  });

  final ZekrCard widget;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ZekrCardColumn(widget: widget, fontScale: fontScale),
      ),
    );
  }
}
