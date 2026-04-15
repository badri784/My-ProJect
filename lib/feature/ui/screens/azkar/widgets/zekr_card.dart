import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/model/azkar_model.dart';
import 'package:quran_azkar/generated/l10n.dart';

import '../../../../logic/cubit/settings_cubit.dart';

class ZekrCard extends StatefulWidget {
  ZekrCard({super.key, required this.zekr});

  final AllAzkar zekr;
  late int downcounter;
  @override
  State<ZekrCard> createState() => _ZekrCardState();
}

class _ZekrCardState extends State<ZekrCard> {
  @override
  void initState() {
    super.initState();
    widget.downcounter = widget.zekr.repeat ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    void onTapDownCounter() {
      if (widget.downcounter == 0) return;
      setState(() {
        widget.downcounter--;
      });
      if (widget.downcounter == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // backgroundColor: Colors.red,
            dismissDirection: DismissDirection.horizontal,
            clipBehavior: Clip.hardEdge,
            //  persistentFooterButtons: true,
            // showCloseIcon: true,

            // action: SnackBarAction(
            //   label: 'close',
            //   onPressed: () {
            //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
            //   },
            // ),
            content: Text(S.of(context).repetIsOver),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            elevation: 4.0,
          ),
        );
      }
    }

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final fontScale = state.fontScale;

          return GestureDetector(
            onLongPress: () async {
              await Clipboard.setData(
                ClipboardData(text: widget.zekr.content!),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('تم نسخ الذكر إلى الحافظة'),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  dismissDirection: DismissDirection.horizontal,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  elevation: 4.0,
                ),
              );
            },
            onTap: onTapDownCounter,
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.zekr.title != null &&
                        widget.zekr.title!.isNotEmpty) ...[
                      Text(
                        widget.zekr.title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18 * fontScale,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const Divider(height: 24),
                    ],
                    if (widget.zekr.content != null &&
                        widget.zekr.content!.isNotEmpty) ...[
                      Text(
                        widget.zekr.content!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20 * fontScale,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      verticalSpace(16.h),
                    ],
                    if (widget.zekr.note != null &&
                        widget.zekr.note!.isNotEmpty) ...[
                      Text(
                        widget.zekr.note!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14 * fontScale,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      verticalSpace(16.h),
                    ],
                    if (widget.zekr.referance != null &&
                        widget.zekr.referance!.isNotEmpty) ...[
                      Text(
                        widget.zekr.referance!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14 * fontScale,
                          color: Colors.blueGrey,
                        ),
                      ),
                      verticalSpace(16.h),
                    ],
                    if (widget.zekr.repeat != null && widget.zekr.repeat! > 0)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.teal.withOpacity(0.5),
                            ),
                          ),
                          child: Text(
                            'التكرار: ${widget.downcounter}',
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
            ),
          );
        },
      ),
    );
  }
}
