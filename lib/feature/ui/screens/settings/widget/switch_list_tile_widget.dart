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
        return Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: ColorsManger.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              // ── Dark‑Mode Toggle ─────────────────────────────────────
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: false,
                onChanged: (value) {
                  // TODO: Implement dark mode toggle functionality
                },
              ),

              const Divider(height: 1),

              // ── Language Toggle (Arabic ↔ English) ───────────────────
              SwitchListTile(
                secondary: const Icon(
                  Icons.language,
                  color: ColorsManger.darlkGreen,
                ),
                title: Text(S.of(context).language),
                subtitle: Text(
                  state.isArabic
                      ? S.of(context).arabic
                      : S.of(context).english,
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
