import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/zekr_card.dart';

import '../../../../../core/helpers/padding.dart';

class ZekrCardColumn extends StatelessWidget {
  const ZekrCardColumn({
    super.key,
    required this.widget,
    required this.fontScale,
  });

  final ZekrCard widget;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    bool isZero = widget.downcounter != 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.zekr.title != null && widget.zekr.title!.isNotEmpty) ...[
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
        if (widget.zekr.content != null && widget.zekr.content!.isNotEmpty) ...[
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
        if (widget.zekr.note != null && widget.zekr.note!.isNotEmpty) ...[
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
            style: TextStyle(fontSize: 14 * fontScale, color: Colors.blueGrey),
          ),
          verticalSpace(16.h),
        ],
        if (widget.zekr.repeat != null && widget.zekr.repeat! > 0)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.withOpacity(0.5)),
              ),
              child: isZero
                  ? Text(
                      'التكرار: ${widget.downcounter}',
                      style: TextStyle(
                        fontSize: 14 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    )
                  : const Icon(Icons.done_all),
            ),
          ),
      ],
    );
  }
}
