class Lesson {
  final String subject, classroom, teacher;
  final DateTime start, end;

  Lesson({
    required this.subject,
    required this.classroom,
    required this.teacher,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() => ({
    'subject': subject,
    'classroom': classroom,
    'teacher': teacher,
    'start': start,
    'end': end,
  });
}
