import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokememory/l10n/app_localizations.dart';
import 'package:pokememory/utils/const_desing.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerShared extends StatefulWidget {
  const DrawerShared({super.key});

  @override
  State<DrawerShared> createState() => _DrawerSharedState();
}

class _DrawerSharedState extends State<DrawerShared> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: $colorPrimary,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 20),
                SvgPicture.asset($lordDev, width: 150),
                SizedBox(height: 20),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.pokedex),
                  onTap: () {
                    context.goNamed('list-pokemon');
                  },
                  textColor: $white,
                  trailing: Transform.rotate(
                    angle: 160 * pi / 180,
                    child: Icon(Icons.catching_pokemon, color: $white),
                  ),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.games),
                  onTap: () {
                    context.goNamed('games');
                  },
                  textColor: $white,
                  trailing: Icon(Icons.sports_esports, color: $white),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.lordDev),
                  onTap: () async {
                    final Uri url = Uri.parse($webLordDev);
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  textColor: $white,
                  trailing: SvgPicture.asset(
                    $iconGlasse,
                    fit: BoxFit.contain,
                    height: 10,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 20),
            child: Text('@ 2026 < Lord / Dev > All rigths reserved'),
          ),
        ],
      ),
    );
  }
}
