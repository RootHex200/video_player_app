

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


String dateDifference(String date){
    // Parse the input date string
  DateTime inputDate = DateTime.parse(date);

  // Get the current date and time
  DateTime currentDate = DateTime.now();

  // Calculate the difference in days, months, and years
  int days = currentDate.difference(inputDate).inDays;
  int months= currentDate.month - inputDate.month + (currentDate.year - inputDate.year) * 12;
  int years = currentDate.year - inputDate.year;
    if (years > 0) {
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  } else if (months > 0) {
    return '$months ${months == 1 ? 'month' : 'months'} ago';
  } else {
    return '$days ${days == 1 ? 'day' : 'days'} ago';
  }
}