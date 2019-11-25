import 'package:flappy_capitals/core/blocs/search/bloc.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  final VoidCallback onTap;
  final void Function(String) onChanged;

  const Search({
    Key key,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _currentValue = "";
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.isBigScreen(context) ? 55 : 45,
      width: Utils.isBigScreen(context)
          ? AppTheme.of(context).values.bigSearchWidth
          : AppTheme.of(context).values.smallSearchWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: _buildRowContent(context),
      ),
    );
  }

  Widget _buildRowContent(BuildContext context) {
    final Widget row = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            AppTheme.of(context).images.icSearch,
            height: 20,
            width: 20,
          ),
        ),
        Expanded(
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: I18n.of(context).search_hint,
              hintStyle: AppTheme.of(context).textStyles.smallLightGreyText,
            ),
            style: AppTheme.of(context).textStyles.mediumBlackText,
            enabled: widget.onChanged != null,
            onChanged: (String newValue) {
              setState(() {
                _currentValue = newValue;
              });
              if (widget.onChanged != null) {
                widget.onChanged(newValue);
              }
            },
          ),
        ),
        _buildClear(context),
      ],
    );

    if (widget.onChanged == null) {
      return InkWell(
        onTap: widget.onTap,
        child: row,
      );
    }

    return row;
  }

  Widget _buildClear(BuildContext context) {
    if (_currentValue.isNotEmpty) {
      return InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () {
          setState(() {
            _currentValue = "";
            _textEditingController.clear();
            BlocProvider.of<SearchBloc>(context).add(ClearSearch());
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            AppTheme.of(context).images.icClose,
            height: 10,
            width: 10,
            color: Colors.black,
          ),
        ),
      );
    }

    return Container();
  }
}
