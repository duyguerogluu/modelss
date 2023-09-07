String parseDate(DateTime? date) {
  date ??= DateTime.now();
  var day = date.day.toString().padLeft(2, '0');
  var month = date.month.toString().padLeft(2, '0');
  return '$day/$month/${date.year}';
}
