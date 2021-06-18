import 'package:easistent_timetable/src/constants.dart';
import 'package:web_scraper/web_scraper.dart';

final scraper = WebScraper(APP_URL);

class EATimetable {
  final String schoolId;

  EATimetable(this.schoolId);
}