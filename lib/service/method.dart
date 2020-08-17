import 'package:card_slash/feature.dart';

List<String> gistToFileName(List<GistData> gistDataList) {
  List<String> save_strings = List();
  List<GistData> gistDatas = gistDataList;
  gistDatas.reversed.forEach((f) {
    save_strings.add(f.files.keys.first.toString());
  });
  return save_strings;
}
