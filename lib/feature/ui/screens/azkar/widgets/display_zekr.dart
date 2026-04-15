import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/logic/cubit/zekr_cubit.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/bloc_builder_all_azkar.dart';

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
    return BlocProvider<ZekrCubit>(
      create: (context) =>
          ZekrCubit()..loadAzkar(fileName: fileName, jsonKey: jsonKey),
      child: Scaffold(
        backgroundColor: ColorsManger.offWhite,
        appBar: AppBar(
          title: Text(title),
          backgroundColor: ColorsManger.offWhite,
        ),
        body: SafeArea(
          child: BlocBuilderAllAzkar(fileName: fileName, jsonKey: jsonKey),
        ),
      ),
    );
  }
}
