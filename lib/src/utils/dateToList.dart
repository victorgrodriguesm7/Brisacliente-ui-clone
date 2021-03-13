import 'package:Brisacliente/src/utils/intToMonth.dart';

List<String> dateToList(String date) {
  String day;
  String month;
  String year;
  RegExp regExp = new RegExp(r"\d+");
  List matches = List.from(regExp.allMatches(date).map((m) => m.group(0)));
  day = matches[0];
  month = intToMonth(int.parse(matches[1]));
  year = matches[2];

  return [day, month, year];
}