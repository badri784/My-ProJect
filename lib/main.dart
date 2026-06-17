import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/routing/app_router.dart';
import 'package:quran_azkar/quran.dart';
import 'package:quran_azkar/simble_bloc.dart';

void main() {
  Bloc.observer = SimbleBloc();
  runApp(Quran(AppRouter()));
}
