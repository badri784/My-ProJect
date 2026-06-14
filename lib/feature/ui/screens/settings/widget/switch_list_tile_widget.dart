import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../feature/logic/cubit/settings_cubit.dart';
import '../../../../../generated/l10n.dart';

class SwitchListTileWidget extends StatelessWidget {
  const SwitchListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withOpacity(0.1) : ColorsManger.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              // ── Dark‑Mode Toggle ─────────────────────────────────────
              // SwitchListTile(
              //   title: const Text('Dark Mode'),
              //   value: false,
              //   onChanged: (value) {
              //   },
              // ),
              // const Divider(height: 1),

              // ── Language Toggle (Arabic ↔ English) ───────────────────
              SwitchListTile(
                secondary: Icon(
                  Icons.language,
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : ColorsManger.white,
                ),
                title: Text(S.of(context).language),
                subtitle: Text(
                  state.isArabic ? S.of(context).arabic : S.of(context).english,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManger.darkGrayTextSettings,
                  ),
                ),
                activeColor: ColorsManger.darlkGreen,
                value: state.isArabic,
                onChanged: (_) {
                  context.read<SettingsCubit>().toggleLocale();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
