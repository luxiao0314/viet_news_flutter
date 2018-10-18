import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';

typedef Future<void> PressOperationCallback();

class SelectItem extends StatefulWidget {
  const SelectItem({
    @required this.label,
    this.iconAssetLabel,
    this.value,
    this.isSelected = false,
    this.onPress,
  }) : assert(label != null);

  final String label;
  final String iconAssetLabel;
  final String value;
  final bool isSelected;
  final PressOperationCallback onPress;

  @override
  State<StatefulWidget> createState() => new SelectItemState();
}

class SelectItemState extends State<SelectItem> {
  bool switchValue = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];
    //暂时未用到
    if (widget.iconAssetLabel != null) {
      rowChildren.add(
        Padding(
          padding: const EdgeInsets.only(
            left: left_right_margin,
            bottom: 2.0,
          ),
          child: Image.asset(
            'assets/${widget.iconAssetLabel}.png',
            package: 'ios_settings_icons',
            height: icon_height,
          ),
        ),
      );
    }

    Widget titleSection;
    titleSection = Padding(
      padding: EdgeInsets.only(top: 1.5),
      child: Text(widget.label, style: text_style_16_black),
    );

    rowChildren.add(
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            left: left_right_margin,
          ),
          child: titleSection,
        ),
      ),
    );

    final List<Widget> rightRowChildren = [];
    if (widget.value != null) {
      rightRowChildren.add(
        Padding(
          padding: const EdgeInsets.only(
            top: 1.5,
            right: 2.25,
          ),
          child: Text(
            widget.value,
            style: TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ),
      );
    }

    if (widget.isSelected) {
      rightRowChildren.add(
        Padding(
          padding: const EdgeInsets.only(
            top: 0.5,
            left: 2.25,
          ),
          child: Icon(
            CupertinoIcons.check_mark,
            color: mediumGrayColor,
            size: 21.0,
          ),
        ),
      );
    }

    rightRowChildren.add(Padding(
      padding: const EdgeInsets.only(right: 8.5),
    ));

    rowChildren.add(
      Row(
        children: rightRowChildren,
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: pressed ? itemPressedColor : const Color(0x00FFFFFF),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.onPress != null) {
            setState(() {
              pressed = true;
            });
            widget.onPress().whenComplete(() {
              Future.delayed(
                Duration(milliseconds: 150),
                () {
                  setState(() {
                    pressed = false;
                  });
                },
              );
            });
          }
        },
        child: SizedBox(
          height: item_height,
          child: Row(
            children: rowChildren,
          ),
        ),
      ),
    );
  }
}
