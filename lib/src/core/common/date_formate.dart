

String customDateFormte(String inputedate){
  DateTime date = DateTime.parse(inputedate);
    List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  String month = months[date.month - 1];
  String day = date.day.toString();
  String year = date.year.toString();

  return '$month $day, $year';
}