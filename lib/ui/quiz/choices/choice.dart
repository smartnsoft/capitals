import 'package:auto_size_text/auto_size_text.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

enum ChoiceCellType {
  normal,
  small,
}

class Choice extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;
  final bool isAnswer;
  final bool showAnswer;
  final ChoiceCellType choiceCellType;

  const Choice({
    Key key,
    @required this.choice,
    @required this.onTap,
    this.isAnswer = false,
    this.showAnswer = false,
    this.choiceCellType = ChoiceCellType.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _getHeight(context),
      width: _getWidth(context),
      decoration: BoxDecoration(
        color: showAnswer && !isAnswer ? Colors.white10 : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: _buildContent(context),
      ),
    );
  }

  double _getHeight(BuildContext context) {
    if (choiceCellType == ChoiceCellType.small) {
      return 80;
    }

    return Utils.isBigScreen(context) ? 120 : 90;
  }

  double _getWidth(BuildContext context) {
    if (choiceCellType == ChoiceCellType.small) {
      return MediaQuery.of(context).size.width * .3;
    }
    return 320 > MediaQuery.of(context).size.width * .6 ? MediaQuery.of(context).size.width * .6 : 320;
  }

  Widget _buildContent(BuildContext context) {
    final Widget content = Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AutoSizeText(
          choice,
          maxLines: 2,
          style: _getStyle(context),
          minFontSize: Utils.isBigScreen(context) ? 22 : 16,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    if (showAnswer) {
      return content;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      enableFeedback: !showAnswer,
      child: content,
    );
  }

  TextStyle _getStyle(BuildContext context) {
    if (showAnswer) {
      if (isAnswer) {
        if (Utils.isBigScreen(context)) {
          return AppTheme.of(context).textStyles.bigMediumBlackText.copyWith(
                fontWeight: FontWeight.bold,
              );
        }
        return AppTheme.of(context).textStyles.littleMediumBlackText.copyWith(
              fontWeight: FontWeight.bold,
            );
      } else {
        return Utils.isBigScreen(context)
            ? AppTheme.of(context).textStyles.bigLightBlackText
            : AppTheme.of(context).textStyles.littleLightBlackText;
      }
    }

    return Utils.isBigScreen(context)
        ? AppTheme.of(context).textStyles.bigMediumBlackText
        : AppTheme.of(context).textStyles.littleMediumBlackText;
  }
}
