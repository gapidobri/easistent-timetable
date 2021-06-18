import 'package:easistent_timetable/src/constants.dart';
import 'package:easistent_timetable/easistent_timetable.dart';
import 'package:easistent_timetable/src/models/ea_timetable.dart';

Future<String> getSchoolName(EATimetable timetable) async {
  await scraper.loadWebPage(TIMETABLES_ENDPOINT + timetable.schoolId);

  final elm = scraper.getElement(
    '#okvir_prijava > h1',
    [],
  );

  return elm.first['title'];
}
