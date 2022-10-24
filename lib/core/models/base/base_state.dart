import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/extensions/context_extension.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => context.theme;
  Function(String) get translate => context.translate;
}
