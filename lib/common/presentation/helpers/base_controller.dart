import 'package:flutter/foundation.dart';

import 'ui_state.dart';


abstract class BaseController {
  abstract ValueNotifier<UIState> state;
  
  void init();
  void dispose();
}