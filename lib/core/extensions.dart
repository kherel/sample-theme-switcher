import 'package:flutter/foundation.dart';

enum ApplicationPages { screenDashboard, screenProfile }
extension RouteExtensions on ApplicationPages {
  String get route => describeEnum(this);
}
