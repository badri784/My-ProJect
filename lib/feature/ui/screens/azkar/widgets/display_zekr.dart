import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/logic/cubit/zekr_cubit.dart';
import 'package:quran_azkar/feature/logic/cubit/zekr_state.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/zekr_card.dart';

class DisplayZekr extends StatelessWidget {
  const DisplayZekr({
    super.key,
    required this.fileName,
    required this.jsonKey,
    required this.title,
  });
  final String fileName;
  final String title;
  final String jsonKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ZekrCubit>(
      create: (context) =>
          ZekrCubit()..loadAzkar(fileName: fileName, jsonKey: jsonKey),
      child: Scaffold(
        backgroundColor: ColorsManger.offWhite,
        appBar: AppBar(
          title: Text(title),
          backgroundColor: ColorsManger.offWhite,
        ),
        body: SafeArea(
          child: BlocBuilder<ZekrCubit, ZekrState>(
            builder: (context, state) {
              if (state is ZekrLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ZekrError) {
                return SimpleDialog(
                  title: const Text('Error'),
                  children: [
                    const Text('Something went wrong'),
                    TextButton(
                      onPressed: () {
                        context.read<ZekrCubit>().loadAzkar(
                          fileName: fileName,
                          jsonKey: jsonKey,
                        );
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                );
              }
              if (state is ZekrLoaded) {
                final item = state.azkar;
                return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return ZekrCard(zekr: item[index]);
                  },
                );
              }
              return const Center(child: SizedBox.shrink());
            },
          ),
        ),
      ),
    );
  }
}
