import 'package:flappy_capitals/core/blocs/progress_bloc/bloc.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!Utils.isBigScreen(context)) return Container();
    return Container(
      height: 20,
      width: AppTheme.of(context).values.horizontalProgressBarWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          BlocBuilder(
            bloc: BlocProvider.of<ProgressBloc>(context),
            builder: (BuildContext context, ProgressState state) {
              if (state is TimerProgressed) {
                double displayedProgression = 0.0;
                if (state.maxDurationInSeconds > 0) {
                  displayedProgression = (state.progressionInSeconds / (state.maxDurationInSeconds - 1)) *
                      AppTheme.of(context).values.horizontalProgressBarWidth;
                }

                return AnimatedContainer(
                  padding: EdgeInsets.all(0),
                  duration: Duration(seconds: 1),
                  width: displayedProgression,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).colors.primaryAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
