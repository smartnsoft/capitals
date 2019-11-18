import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;
  final bool isAnswer;
  final bool showAnswer;

  const Choice({
    Key key,
    @required this.choice,
    @required this.onTap,
    this.isAnswer = false,
    this.showAnswer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 320 > MediaQuery.of(context).size.width * .8 ? MediaQuery.of(context).size.width * .8 : 320,
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

  Widget _buildContent(BuildContext context) {
    final Widget content = Center(
      child: Text(
        choice,
        style: _getStyle(context),
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
