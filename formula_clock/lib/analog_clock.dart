// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'package:flare_flutter/flare_actor.dart';
import 'drawn_hand.dart';

final radiansPerTick = radians(360 / 60);

final radiansPerHour = radians(360 / 12);

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  var _now = DateTime.now();

  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set the initial values.
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(AnalogClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {});
  }

  int currentIndex = 0;

  void _updateTime() {
    setState(() {
      _now = DateTime.now();

      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );

      int numconvert = _now.hour;

      currentIndex = _now.hour;

      if (currentIndex > 11) {
        currentIndex = numconvert - 12;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var containers = [
      Container(
        child: FlareActor(
          'assets/hour12.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour1.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour2.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour3.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour4.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour5.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour6.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour7.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour8.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour9.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour10.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
      Container(
        child: FlareActor(
          'assets/hour11.flr',
          alignment: Alignment.center,
          animation: "Untitled",
        ),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/blackboard.jpeg"),
              fit: BoxFit.cover)),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            DrawnHand(
              color: Color(0xff5f5f5f),
              thickness: 4,
              size: 0.9,
              angleRadians: _now.second * radiansPerTick,
            ),
            DrawnHand(
              color: Color(0xff5f5f5f),
              thickness: 10,
              size: 0.8,
              angleRadians: _now.minute * radiansPerTick,
            ),
            Container(
              width: 300,
              height: 250,
              alignment: Alignment.center,
              child: containers[currentIndex],
            ),
          ],
        ),
      ),
    );
  }
}
