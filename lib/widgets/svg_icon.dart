// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum _SvgIconType {
  string,
  asset,
  network,
  memory,
  file,
}

class SvgIcon extends StatelessWidget {
  final Object provider;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final _SvgIconType type;

  const SvgIcon.string(
    String source, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  })  : type = _SvgIconType.string,
        provider = source,
        super(key: key);

  const SvgIcon.asset(
    String assetName, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  })  : type = _SvgIconType.asset,
        provider = assetName,
        super(key: key);

  const SvgIcon.network(
    String url, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  })  : type = _SvgIconType.network,
        provider = url,
        super(key: key);

  const SvgIcon.memory(
    Uint8List bytes, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  })  : type = _SvgIconType.memory,
        provider = bytes,
        super(key: key);

  const SvgIcon.file(
    File file, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  })  : type = _SvgIconType.file,
        provider = file,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double? iconSize = size ?? iconTheme.size;
    final double iconOpacity = iconTheme.opacity ?? 1.0;

    Color? iconColor = color ?? iconTheme.color;
    if (iconColor != null && iconOpacity != 1.0) {
      iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
    }

    switch (type) {
      case _SvgIconType.string:
        return SvgPicture.string(
          provider as String,
          color: iconColor,
          height: iconSize,
          width: iconSize,
          semanticsLabel: semanticLabel,
        );
      case _SvgIconType.asset:
        return SvgPicture.asset(
          provider as String,
          color: iconColor,
          height: iconSize,
          width: iconSize,
          semanticsLabel: semanticLabel,
        );
      case _SvgIconType.network:
        return SvgPicture.network(
          provider as String,
          color: iconColor,
          height: iconSize,
          width: iconSize,
          semanticsLabel: semanticLabel,
        );
      case _SvgIconType.memory:
        return SvgPicture.memory(
          provider as Uint8List,
          color: iconColor,
          height: iconSize,
          width: iconSize,
          semanticsLabel: semanticLabel,
        );
      case _SvgIconType.file:
        return SvgPicture.file(
          provider as File,
          color: iconColor,
          height: iconSize,
          width: iconSize,
          semanticsLabel: semanticLabel,
        );
    }
  }
}
