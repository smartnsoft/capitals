import 'package:flappy_capitals/ui/quiz/choices/choice.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Choices extends StatelessWidget {
  final List<String> choices;

  const Choices({
    Key key,
    this.choices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (choices.isEmpty) return Container();

    final List<Choice> choicesWidgets = choices
        .map((choice) => Choice(
              choice: choice,
              onTap: () => _onChoiceSelect(choice),
            ))
        .toList();
    if (choices.length <= 2) {
      return _buildEasyChoices(context, choicesWidgets);
    } else {
      return _buildMediumChoices(context, choicesWidgets);
    }
  }

  _onChoiceSelect(String choice) {
    print("Selected $choice");
  }

  Widget _buildEasyChoices(BuildContext context, List<Choice> choicesWidgets) {
    if (Utils.isBigScreen(context)) {
      return Wrap(
        spacing: 15,
        children: choicesWidgets,
      );
    }

    return Wrap(
      spacing: 15,
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: choicesWidgets,
    );
  }

  Widget _buildMediumChoices(BuildContext context, List<Choice> choicesWidgets) {
    return Container();
  }
}
