class CalendarItem {
  static String table = "events";
  
  int id;
  String name;
  String date;

  CalendarItem({required this.id, required this.name, required this.date});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name, 
      'date': date
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

    static CalendarItem fromMap(Map<String, dynamic> map) {
    return CalendarItem(
        id: map['id'],
        name: map['name'],
        date: map['date']);
  }
}
