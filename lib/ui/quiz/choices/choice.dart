import 'package:auto_size_text/auto_size_text.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
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
      height: 120,
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

  double _getWidth(BuildContext context) {
    if (choiceCellType == ChoiceCellType.small) return MediaQuery.of(context).size.width * .35;
    return 320 > MediaQuery.of(context).size.width * .7 ? MediaQuery.of(context).size.width * .7 : 320;
  }

  Widget _buildContent(BuildContext context) {
    final Widget content = Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AutoSizeText(
          choice,
          maxLines: 2,
          style: _getStyle(context),
          minFontSize: 22,
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
      return isAnswer
          ? AppTheme.of(context).textStyles.bigMediumBlackText.copyWith(fontWeight: FontWeight.bold)
          : AppTheme.of(context).textStyles.bigLightBlackText;
    }

    return AppTheme.of(context).textStyles.bigMediumBlackText;
  }

}
