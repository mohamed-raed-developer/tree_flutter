class Utils {
  static String getFormattedDateTime({required DateTime dateTime}) {
    String day = '${dateTime.day}';
    String month = '${dateTime.month}';
    String year = '${dateTime.year}';

    String hour = '${dateTime.hour}';
    String minute = '${dateTime.minute}';
    String second = '${dateTime.second}';
    return '$day/$month/$year $hour/$minute/$second';
  }
}