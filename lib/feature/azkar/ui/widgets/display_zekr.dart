import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/azkar/logic/cubit/zekr_cubit.dart';
import 'package:quran_azkar/feature/azkar/ui/widgets/bloc_builder_all_azkar.dart';

class DisplayZekr extends StatelessWidget {
  const DisplayZekr({
    super.key,
    required this.fileName,
    required this.jsonKey,
    required this.title,
  });
  final String fileName;
  final String title;
  final String jsonKey;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider<ZekrCubit>(
      create: (context) =>
          ZekrCubit()..loadAzkar(fileName: fileName, jsonKey: jsonKey),
      child: Scaffold(
        backgroundColor: isDark
            ? ColorsManger.backgroundDark
            : ColorsManger.offWhite,
        appBar: AppBar(
          title: Text(title),
          backgroundColor: isDark
              ? ColorsManger.backgroundDark
              : ColorsManger.offWhite,
        ),
        body: SafeArea(
          child: BlocBuilderAllAzkar(fileName: fileName, jsonKey: jsonKey),
        ),
      ),
    );
  }
}
