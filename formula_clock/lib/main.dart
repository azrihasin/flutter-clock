// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'analog_clock.dart';

void main() {
  runApp(ClockCustomizer((ClockModel model) => AnalogClock(model)));
}
