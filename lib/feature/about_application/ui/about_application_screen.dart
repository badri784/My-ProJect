import 'package:flutter/material.dart';
import 'package:quran_azkar/generated/l10n.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).aboutApp)),
      body: null,
    );
  }
}
