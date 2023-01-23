// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: non_constant_identifier_names

@JS()
library analytics;

import 'dart:html';

import 'package:js/js.dart';

@JS('gtag')
external void gtag(
  String event,
  String action, [
  GTagAnalyticsEventOptions? eventParams,
]);

void sendTiming(
  String name, {
  int? value,
  String? eventCategory,
  String? eventLabel,
}) {
  value ??= window.performance.now().toInt();

  gtag(
    'send',
    'timing_complete',
    GTagAnalyticsEventOptions(
      name: name,
      value: value,
      event_category: eventCategory,
      event_label: eventLabel,
    ),
  );
}

@JS()
@anonymous
class GTagAnalyticsEventOptions {
  external String get event_category;

  external String get event_label;

  external int get value;

  external int get name;

  external factory GTagAnalyticsEventOptions({
    String? event_category,
    String? event_label,
    int? value,
    String? name,
  });
}
