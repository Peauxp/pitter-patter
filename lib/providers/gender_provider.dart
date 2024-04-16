import 'package:gender_reveal/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gender_provider.g.dart';

enum Gender { unset, boy, girl }

@riverpod
class CurrentGender extends _$CurrentGender {
  @override
  Gender build() {
    return Gender.unset;
  }

  void set(String code) {
    if (codes.containsKey(code.toUpperCase())) {
      state = codes[code.toUpperCase()];
    } else {
      globalSnackBar(message: 'Invalid code');
    }
  }
}

Map<String, dynamic> codes = {
  'UVOW': Gender.boy,
  'OWNV': Gender.girl,
};
