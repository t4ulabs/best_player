// Flutter imports:
// Project imports:
import 'package:flutter/material.dart';

import '../../better_player.dart';

///Widget which is used to inherit BetterPlayerController through widget tree.
class BetterPlayerControllerProvider extends InheritedWidget {
  const BetterPlayerControllerProvider({
    Key key,
    @required this.controller,
    @required Widget child,
  }) : super(key: key, child: child);

  final BetterPlayerController controller;

  @override
  bool updateShouldNotify(BetterPlayerControllerProvider old) =>
      controller != old.controller;
}
