import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).termsAndConditions)),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 10, left: 15, right: 15)),
      ),
    );
  }
}
