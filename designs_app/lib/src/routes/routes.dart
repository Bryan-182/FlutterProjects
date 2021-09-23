import 'package:designs_app/src/pages/animate_do_home_page.dart';
import 'package:designs_app/src/pages/animations_page.dart';
import 'package:designs_app/src/pages/emergency_home_page.dart';
import 'package:designs_app/src/pages/header_pager.dart';
import 'package:designs_app/src/pages/navigation_page.dart';
import 'package:designs_app/src/pages/pinterest_home_page.dart';
import 'package:designs_app/src/pages/progress_bar_page.dart';
import 'package:designs_app/src/pages/slideshow_home_page.dart';
import 'package:designs_app/src/pages/slivers_home_page.dart';
import 'package:designs_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.running, 'Animate do', AnimateDoHomePage()),
  _Route(FontAwesomeIcons.running, 'Animations', AnimationsPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyHomePage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.dog, 'Pet app', NavigationPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestHomePage()),
  _Route(FontAwesomeIcons.bars, 'Progress bar', ProgressBar()),
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowHomePage()),
  _Route(FontAwesomeIcons.slidersH, 'Slivers', SliversHomePage()),
  _Route(FontAwesomeIcons.twitter, 'Twitter', TwitterPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
