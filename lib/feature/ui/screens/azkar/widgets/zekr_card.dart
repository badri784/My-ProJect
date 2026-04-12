import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/model/azkar_model.dart';

import '../../../../logic/cubit/settings_cubit.dart';

class ZekrCard extends StatelessWidget {
  final AllAzkar zekr;

  const ZekrCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final fontScale = state.fontScale;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (zekr.title != null && zekr.title!.isNotEmpty) ...[
                    Text(
                      zekr.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const Divider(height: 24),
                  ],
                  if (zekr.content != null && zekr.content!.isNotEmpty) ...[
                    Text(
                      zekr.content!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20 * fontScale,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpace(16.h),
                  ],
                  if (zekr.note != null && zekr.note!.isNotEmpty) ...[
                    Text(
                      zekr.note!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14 * fontScale,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    verticalSpace(16.h),
                  ],
                  if (zekr.referance != null && zekr.referance!.isNotEmpty) ...[
                    Text(
                      zekr.referance!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14 * fontScale,
                        color: Colors.blueGrey,
                      ),
                    ),
                    verticalSpace(16.h),
                  ],
                  if (zekr.repeat != null && zekr.repeat! > 0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.teal.withOpacity(0.5),
                          ),
                        ),
                        child: Text(
                          'التكرار: ${zekr.repeat}',
                          style: TextStyle(
                            fontSize: 14 * fontScale,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
