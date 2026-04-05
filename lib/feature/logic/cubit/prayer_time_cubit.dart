import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  Future<void> getPrayerTimes() async {
    emit(PrayerTimeLoading());

    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(PrayerTimeError('Location services are disabled.'));
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(PrayerTimeError('Location permissions are denied'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          PrayerTimeError(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        );
        return;
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      // Try to get last known position first (fast)
      Position? position = await Geolocator.getLastKnownPosition();

      position ??= await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );

      final myCoordinates = Coordinates(position.latitude, position.longitude);

      // Setup calculation parameters, Egyptian General Authority of Survey is commonly used in Egypt
      // We can also use MuslimWorldLeague or others
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.shafi;

      final date = DateComponents.from(DateTime.now());

      final prayerTimes = PrayerTimes(myCoordinates, date, params);

      emit(PrayerTimeLoaded(prayerTimes));
    } catch (e) {
      emit(PrayerTimeError('Failed to load prayer times: $e'));
    }
  }
}
