import 'package:flutter/material.dart';

/// Class for styling Calendar's header.
class HeaderStyle {
  /// Provide text style for calendar's header.
  final TextStyle? headerTextStyle;

  /// Determines left icon visibility.
  final bool leftIconVisible;

  /// Determines right icon visibility.
  final bool rightIconVisible;

  /// Internal padding of the whole header.
  final EdgeInsets headerPadding;

  /// External margin of the whole header.
  final EdgeInsets headerMargin;

  /// Internal padding of left icon.
  final EdgeInsets leftIconPadding;

  /// Internal padding of right icon.
  final EdgeInsets rightIconPadding;

  /// Define Alignment of header text.
  final TextAlign titleAlign;

  /// Decoration of whole header.
  final BoxDecoration? decoration;

  /// Defines the alignment between components of header.
  final MainAxisAlignment mainAxisAlignment;

  /// Widget used for left icon.
  ///
  /// Tapping on it will navigate to previous calendar page.
  final Widget? leftIcon;

  /// Widget used for right icon.
  ///
  /// Tapping on it will navigate to next calendar page.
  final Widget? rightIcon;

  /// Provides icon style for default left Icon.
  ///
  /// Will be ignored if [leftIcon] is not null.
  final IconStyle leftIconStyle;

  /// Provides icon style for default right Icon.
  ///
  /// Will be ignored if [rightIcon] is not null.
  final IconStyle rightIconStyle;

  /// Create a `HeaderStyle` of calendar view
  const HeaderStyle({
    this.headerTextStyle,
    this.leftIcon,
    this.rightIcon,
    this.leftIconVisible = true,
    this.rightIconVisible = true,
    this.headerMargin = EdgeInsets.zero,
    this.headerPadding = EdgeInsets.zero,
    this.leftIconPadding = const EdgeInsets.all(10),
    this.rightIconPadding = const EdgeInsets.all(10),
    this.titleAlign = TextAlign.center,
    this.decoration,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.leftIconStyle = const IconStyle(),
    this.rightIconStyle = const IconStyle(),
  });
}

class IconStyle {
  final Color color;
  final double size;

  const IconStyle({
    this.color = Colors.black,
    this.size = 30,
  });
}
