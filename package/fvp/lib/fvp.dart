// Copyright 2022 Wang Bin. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'src/video_player_mdk.dart'
    if (dart.library.html) 'src/video_player_dummy.dart';

/// Registers this plugin as the default instance of [VideoPlayerPlatform]. Then your [VideoPlayer] will support all platforms.

/// [options] can be
/// 'platforms': a list of [Platform.operatingSystem], only these platforms will use this plugin implementation. You can still use official implementation for android and ios if they are not in the list.
/// If 'platforms' not set, this implementation will be used for all platforms.
///
/// 'fastSeek': bool. default is false, faster but not accurate, i.e. result position can be a few seconds different from requested position
///
/// "video.decoders": a list of decoder names. supported decoders: https://github.com/wang-bin/mdk-sdk/wiki/Decoders
///
/// "maxWidth", "maxHeight": texture max size. if not set, video frame size is used. a small value can reduce memory cost, but may result in lower image quality.
///
/// "player": backend player properties of type Map<String, String>. See https://github.com/wang-bin/mdk-sdk/wiki/Player-APIs#void-setpropertyconst-stdstring-key-const-stdstring-value
///
/// "global": backend global options of type Map<String, Object>. See https://github.com/wang-bin/mdk-sdk/wiki/Global-Options
///
/// Example:
/// ```dart
/// registerWith({options: {
///     'platforms': ['windows', 'linux', 'macos'], # or other Platform.operatingSystem
///     'video.decoders': ['BRAW:scale=1/4', 'auto'],
///     'maxWidth': screenWidth,
///     'maxHeight': screenHeight,
///   }});
/// ```
///
void registerWith({dynamic options}) {
  MdkVideoPlayerPlatform.registerVideoPlayerPlatformsWith(options: options);
}

/*
bool isRegistered() {
  return VideoPlayerPlatform.instance.runtimeType == MdkVideoPlayerPlatform;
}
*/
