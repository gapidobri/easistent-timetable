import 'package:easistent_timetable/src/constants.dart';
import 'package:easistent_timetable/src/scrapers/class_scraper.dart' as app;
import 'package:easistent_timetable/src/scrapers/classroom_scraper.dart' as app;
import 'package:easistent_timetable/src/scrapers/student_scraper.dart' as app;
import 'package:easistent_timetable/src/scrapers/school_scraper.dart';
import 'package:web_scraper/web_scraper.dart';

import 'class.dart';
import 'classroom.dart';

final scraper = WebScraper(APP_URL);

class EATimetable {
  final String schoolId;

  EATimetable(this.schoolId);

  Future<String> get schoolName => getSchoolName(this);
  Future<List<Class>> getClasses() => app.getClasses(this);
  Future<List<Classroom>> getClassrooms() => app.getClassrooms(this);
  // Future<List<String>> getStudents() => app.getStudents(this);

}