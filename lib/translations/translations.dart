import 'package:get/get.dart' as GetX show Translations;

part 'zh-cn.dart';

const Map<String, Map<String, String>> _$keys = {
  'zh_CN': _ZH_CN_MESSAGE,
};

class Translations extends GetX.Translations {
  @override
  Map<String, Map<String, String>> get keys => _$keys;
}
