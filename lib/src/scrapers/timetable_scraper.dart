import 'package:basic_utils/basic_utils.dart';
import 'package:easistent_timetable/src/constants.dart';
import 'package:easistent_timetable/src/models/ea_timetable.dart';
import 'package:easistent_timetable/src/models/lesson.dart';
import 'package:html/parser.dart';

Future<List<Lesson>> getLessons(EATimetable timetable) async {
  final List<Lesson> lessons = [];

  final html = await HttpUtils.getForString(
      APP_URL + TIMETABLES_ENDPOINT + timetable.schoolId);

  final document = parse(
    html.replaceAll('\t', '').replaceAll('\n', '').replaceAll('\r', ''),
  );

  final dateCells = document.getElementsByTagName('th');
  final cells = document.getElementsByClassName('ednevnik-seznam_ur_teden-td');
  final colCount = 6;
  final rowCount = cells.length ~/ colCount;

  for (int col = 1; col < colCount; col++) {
    for (int row = 0; row < rowCount; row++) {
      final cell = cells[(row * colCount) + col];

      final subjectE = cell.getElementsByTagName('span');
      if (subjectE.isEmpty) continue;
      final subject = subjectE.first.text.trim();

      final infoE = cell.getElementsByClassName('text11');
      if (infoE.isEmpty) continue;
      final info = infoE.first;
      final teacher =
          info.attributes['title'] ?? info.text.split(', ').first.trim();
      final classroom = info.text.split(', ').last.trim();

      final timeCell = cells[(row * colCount)];
      final time = timeCell.children.last.text;

      final dateCell = dateCells[col];
      final dateString = dateCell.children.last.text;
      final dateParts = dateString.split('.');
      final month = int.parse(dateParts[1].trim());
      final day = int.parse(dateParts.first.trim());

      final date = DateTime(DateTime.now().year, month, day);

      final times = time.split(' - ');

      final startTimeParts = times.first.split(':');
      final startTimeHours = int.parse(startTimeParts.first);
      final startTimeMinutes = int.parse(startTimeParts.last);
      final startTime = date.add(Duration(
        hours: startTimeHours,
        minutes: startTimeMinutes,
      ));

      final endTimeParts = times.last.split(':');
      final endTimeHours = int.parse(endTimeParts.first);
      final endTimeMinutes = int.parse(endTimeParts.last);
      final endTime = date.add(Duration(
        hours: endTimeHours,
        minutes: endTimeMinutes,
      ));

      lessons.add(
        Lesson(
          subject: subject,
          classroom: classroom,
          teacher: teacher,
          start: startTime,
          end: endTime,
        ),
      );
    }
  }

  return lessons;
}
