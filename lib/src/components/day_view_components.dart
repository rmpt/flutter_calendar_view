// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../extensions.dart';
import '../style/header_style.dart';
import '../typedefs.dart';
import 'common_components.dart';

/// This class defines default tile to display in day view.
class RoundedEventTile extends StatelessWidget {
  /// Title of the tile.
  final String title;

  /// Description of the tile.
  final String description;

  // TODO: Remove this in next major release.
  /// Background color of tile.
  /// Default color is [Colors.blue]
  ///
  /// NOTE: This property is deprecated. Use [decoration] instead.
  ///
  @Deprecated("This property id deprecated. Use decoration instead.")
  final Color backgroundColor;

  /// If same tile can have multiple events.
  /// In most cases this value will be 1 less than total events.
  final int totalEvents;

  /// Padding of the tile. Default padding is [EdgeInsets.zero]
  final EdgeInsets padding;

  /// Margin of the tile. Default margin is [EdgeInsets.zero]
  final EdgeInsets margin;

  // TODO: Remove this in next major release.
  /// Border radius of tile.
  ///
  /// NOTE: This property is deprecated. Use [decoration] instead.
  ///
  @Deprecated("This property id deprecated. Use decoration instead.")
  final BorderRadius borderRadius;

  /// Style for title
  final TextStyle? titleStyle;

  /// Style for description
  final TextStyle? descriptionStyle;

  /// Provides decoration for event tile container.
  final BoxDecoration? decoration;

  /// Provides padding for description.
  ///
  final EdgeInsets descriptionPadding;

  /// Provides style for [totalEvents] indicators.
  final TextStyle? extraEventsStyle;

  /// This is default tile to display in day view.
  const RoundedEventTile({
    Key? key,
    required this.title,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.description = "",
    @Deprecated("This property id deprecated. Use decoration instead.")
        this.borderRadius = BorderRadius.zero,
    this.totalEvents = 1,
    @Deprecated("This property id deprecated. Use decoration instead.")
        this.backgroundColor = Colors.blue,
    this.titleStyle,
    this.descriptionStyle,
    this.decoration,
    this.descriptionPadding = const EdgeInsets.only(bottom: 15.0),
    this.extraEventsStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title.isNotEmpty)
            Expanded(
              child: Text(
                title,
                style: titleStyle ??
                    TextStyle(
                      fontSize: 20,
                      color: backgroundColor.accent,
                    ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          if (description.isNotEmpty)
            Expanded(
              child: Padding(
                padding: descriptionPadding,
                child: Text(
                  description,
                  style: descriptionStyle ??
                      TextStyle(
                        fontSize: 17,
                        color: backgroundColor.accent.withAlpha(200),
                      ),
                ),
              ),
            ),
          if (totalEvents > 1)
            Expanded(
              child: Text(
                "+${totalEvents - 1} more",
                style: extraEventsStyle ??
                    TextStyle(
                      color: backgroundColor.accent.withAlpha(200),
                      fontSize: 17,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A header widget to display on day view.
class DayPageHeader extends CalendarPageHeader {
  /// A header widget to display on day view.
  const DayPageHeader({
    Key? key,
    VoidCallback? onNextDay,
    AsyncCallback? onTitleTapped,
    VoidCallback? onPreviousDay,
    StringProvider? dateStringBuilder,
    required DateTime date,
    @Deprecated("Use Header Style to provide icon color")
        Color iconColor = Constants.black,
    @Deprecated("Use Header Style to provide background")
        Color backgroundColor = Constants.headerBackground,
    HeaderStyle headerStyle = const HeaderStyle(),
  }) : super(
          key: key,
          date: date,
          // ignore_for_file: deprecated_member_use_from_same_package
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          onNextDay: onNextDay,
          onPreviousDay: onPreviousDay,
          onTitleTapped: onTitleTapped,
          dateStringBuilder:
              dateStringBuilder ?? DayPageHeader._dayStringBuilder,
          headerStyle: headerStyle,
        );
  static String _dayStringBuilder(DateTime date, {DateTime? secondaryDate}) =>
      "${date.day} - ${date.month} - ${date.year}";
}

class DefaultTimeLineMark extends StatelessWidget {
  /// Defines time to display
  final DateTime date;

  /// StringProvider for time string
  final StringProvider? timeStringBuilder;

  /// Text style for time string.
  final TextStyle? markingStyle;

  /// Time marker for timeline used in week and day view.
  const DefaultTimeLineMark({
    Key? key,
    required this.date,
    this.markingStyle,
    this.timeStringBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeString = (timeStringBuilder != null)
        ? timeStringBuilder!(date)
        : "${((date.hour - 1) % 12) + 1} ${date.hour ~/ 12 == 0 ? "am" : "pm"}";
    return Transform.translate(
      offset: Offset(0, -7.5),
      child: Padding(
        padding: const EdgeInsets.only(right: 7.0),
        child: Text(
          timeString,
          textAlign: TextAlign.right,
          style: markingStyle ??
              TextStyle(
                fontSize: 15.0,
              ),
        ),
      ),
    );
  }
}
