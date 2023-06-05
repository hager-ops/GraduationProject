import 'package:ecosofe_app/common/custom_animated_icon.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomExpansionTile extends StatefulWidget {
  final String headerText;
  final List<Widget> expansionListOfWidget;
  bool initiallyExpanded = false;

  CustomExpansionTile({
    Key? key,
    required this.headerText,
    required this.expansionListOfWidget,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool toggleTrailingIcon = false;

  @override
  void initState() {
    toggleTrailingIcon = widget.initiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 4,),
      decoration: const BoxDecoration(
          color: AppColors.forthColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              widget.headerText,
              style: TextStyles.bold(
                fontSize: 12,
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),
          initiallyExpanded: toggleTrailingIcon,
          onExpansionChanged: (value) {
            if (value) {
              toggleTrailingIcon = true;
            } else {
              toggleTrailingIcon = false;
            }
            setState(() {});
          },
          trailing: CustomAnimatedIcon(
            toggle: toggleTrailingIcon,
            onPressFun: () {},
            firstIcon: Icons.minimize,
            secondIcon: Icons.add,
          ),
          children: widget.expansionListOfWidget,
        ),
      ),
    );
  }
}
