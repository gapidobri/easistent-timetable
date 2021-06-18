import 'package:easistent_timetable/src/constants.dart';
import 'package:easistent_timetable/easistent_timetable.dart';
import 'package:easistent_timetable/src/models/class.dart';
import 'package:easistent_timetable/src/models/ea_timetable.dart';

Future<List<Class>> getClasses(EATimetable timetable) async {
  await scraper.loadWebPage(TIMETABLES_ENDPOINT + timetable.schoolId);

  List<Map<String, dynamic>> elements = scraper.getElement(
    '#id_parameter > option',
    ['value'],
  );

  List<Class> classes = elements.map<Class>((e) => Class.fromJson(e)).toList();

  return classes;
}
