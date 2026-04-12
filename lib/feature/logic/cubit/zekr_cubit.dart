import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/model/azkar_model.dart';
import 'package:quran_azkar/feature/logic/cubit/zekr_state.dart';

import '../../../core/service/service.dart';

class ZekrCubit extends Cubit<ZekrState> {
  final Service _service = Service();

  ZekrCubit() : super(ZekrInitial());

  Future<void> loadAzkar({
    required String fileName,
    required String jsonKey,
  }) async {
    emit(ZekrLoading());
    try {
      final List<AllAzkar> azkarList = await _service.readJson(
        fileName: fileName,
        jsonKey: jsonKey,
      );
      emit(ZekrLoaded(azkarList));
    } catch (e) {
      emit(ZekrError(e.toString()));
    }
  }
}
