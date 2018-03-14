// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSprogressindic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: const Center(
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}
