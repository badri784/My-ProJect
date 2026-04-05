import 'package:flutter/material.dart';
import 'package:quran_azkar/generated/l10n.dart';
import 'qibla_compass.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).qiblaTitle),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const QiblaCompass(),
    );
  }
}
