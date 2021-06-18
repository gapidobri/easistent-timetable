import 'package:easistent_timetable/src/constants.dart';
import 'package:easistent_timetable/easistent_timetable.dart';
import 'package:easistent_timetable/src/models/ea_timetable.dart';

Future<List<int>> getStudents(EATimetable timetable, int classId) async {
  await scraper.loadWebPage(
    TIMETABLES_ENDPOINT +
        timetable.schoolId +
        CLASSES_ENDPOINT +
        classId.toString(),
  );

  final students = scraper
      .getElementTitle('#id_dijak > optgroup > option')
      .map((e) => int.parse(e))
      .toList();

  print(students);
  return students;
}
