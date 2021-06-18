import 'package:easistent_timetable/easistent_timetable.dart';
import 'package:easistent_timetable/src/constants.dart';
import 'package:easistent_timetable/src/models/classroom.dart';
import 'package:easistent_timetable/src/models/ea_timetable.dart';

Future<List<Classroom>> getClassrooms(EATimetable timetable) async {
  await scraper.loadWebPage(
    TIMETABLES_ENDPOINT + timetable.schoolId + CLASSROOMS_ENDPOINT,
  );

  List<Map<String, dynamic>> elements = scraper.getElement(
    '#id_parameter > option',
    ['value'],
  );

  final classrooms = elements.map((e) => Classroom.fromJson(e)).toList();

  return classrooms;
}
