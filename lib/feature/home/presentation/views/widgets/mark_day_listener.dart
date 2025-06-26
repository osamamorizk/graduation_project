import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';

class MarkDayListener extends StatelessWidget {
  const MarkDayListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChallengeCubit, ChallengeState>(
      listener: (context, state) {
        if (state is MarkDaySuccess) {
          showCustomSnackBar(context, text: state.message);
        } else if (state is MarkDayFailure) {
          showCustomSnackBar(context, text: state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
