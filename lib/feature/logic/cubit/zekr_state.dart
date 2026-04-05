import 'package:flutter/material.dart';
import 'package:quran_azkar/core/model/azkar_model.dart';

@immutable
abstract class ZekrState {}

class ZekrInitial extends ZekrState {}

class ZekrLoading extends ZekrState {}

class ZekrLoaded extends ZekrState {
  final List<AllAzkar> azkar; // The generic model used for all Azkar items.

  ZekrLoaded(this.azkar);
}

class ZekrError extends ZekrState {
  final String message;

  ZekrError(this.message);
}
