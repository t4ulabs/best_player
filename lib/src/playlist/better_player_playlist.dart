// Project imports:


// Flutter imports:
import 'package:best_player/src/core/better_player_utils.dart';
import 'package:flutter/material.dart';

import '../../better_player.dart';

///Special version of Better Player used to play videos in playlist.
class BetterPlayerPlaylist extends StatefulWidget {
  final List<BetterPlayerDataSource> betterPlayerDataSourceList;
  final BetterPlayerConfiguration betterPlayerConfiguration;
  final BetterPlayerPlaylistConfiguration betterPlayerPlaylistConfiguration;

  const BetterPlayerPlaylist({
    Key key,
    @required this.betterPlayerDataSourceList,
    @required this.betterPlayerConfiguration,
    @required this.betterPlayerPlaylistConfiguration,
  }) : super(key: key);

  @override
  BetterPlayerPlaylistState createState() => BetterPlayerPlaylistState();
}

///State of BetterPlayerPlaylist, used to access BetterPlayerPlaylistController.
class BetterPlayerPlaylistState extends State<BetterPlayerPlaylist> {
  BetterPlayerPlaylistController _betterPlayerPlaylistController;

  BetterPlayerController get _betterPlayerController =>
      _betterPlayerPlaylistController.betterPlayerController;

  ///Get BetterPlayerPlaylistController
  BetterPlayerPlaylistController get betterPlayerPlaylistController =>
      _betterPlayerPlaylistController;

  @override
  void initState() {
    _betterPlayerPlaylistController = BetterPlayerPlaylistController(
        widget.betterPlayerDataSourceList,
        betterPlayerConfiguration: widget.betterPlayerConfiguration,
        betterPlayerPlaylistConfiguration:
            widget.betterPlayerPlaylistConfiguration);
    //Disable the black bar of pause and play ... on ios
    _betterPlayerController.setControlsEnabled(false);
    _betterPlayerController.setControlsAlwaysVisible(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _betterPlayerController.getAspectRatio() ??
          BetterPlayerUtils.calculateAspectRatio(context),
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }

  @override
  void dispose() {
    _betterPlayerPlaylistController.dispose();
    super.dispose();
  }
}
