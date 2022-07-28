import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:regms_flutter_client/constants/colors.dart';

//bottom-navbar
final Widget heart = SvgPicture.asset('assets/images/svg/heart.svg');
final Widget heartFill = SvgPicture.asset('assets/images/svg/heart_fill.svg');

final Widget messages = SvgPicture.asset('assets/images/svg/messages.svg');
final Widget messagesFill =
    SvgPicture.asset('assets/images/svg/messages_fill.svg');

final Widget search = SvgPicture.asset('assets/images/svg/search.svg');
final Widget searchFill = SvgPicture.asset('assets/images/svg/search_fill.svg');

//appbar
final Widget menuSvg = SvgPicture.asset(
  'assets/images/svg/menu-burger.svg',
  color: Colors.white,
);
final Widget whiteArrowSvg = SvgPicture.asset(
  'assets/images/svg/arrow-small-left.svg',
  color: Colors.white,
);

final Widget searchBTN = SvgPicture.asset(
  'assets/images/svg/search.svg',
  color: kBodyTextColor,
);
