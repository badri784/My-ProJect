import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/model/azkar_model.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/zekr_card_widget.dart';
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
    final snackBar = ScaffoldMessenger.of(context);
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
              snackBar.showSnackBar(
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
            child: ZekrCardWidget(widget: widget, fontScale: fontScale),
          );
        },
      ),
    );
  }
}
