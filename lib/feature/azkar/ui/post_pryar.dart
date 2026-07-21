import 'package:flutter/material.dart';
import 'package:quran_azkar/feature/azkar/ui/widgets/display_zekr.dart';

class PostPryarScreen extends StatelessWidget {
  const PostPryarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DisplayZekr(
      title: 'اذكار بعد الصلاة',
      fileName: 'post_pryar_azkar',
      jsonKey: 'post_pryar_azkar',
    );
  }
}
