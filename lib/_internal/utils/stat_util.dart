import 'package:get/get.dart';

import '../enums/stat_enum.dart';

class StatUtil {
  // *** LABEL METHODS ***
  String getLabelFromStatType(Stat stat) =>
      stat.toString().split('.').last.capitalize;
}
