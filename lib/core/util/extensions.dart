extension StringExtensions on String {
  int toInt() {
    if (isEmpty) {
      return 0;
    }
    return int.parse(this);
  }

  double toDouble() {
    if (isEmpty) {
      return 0;
    }
    return double.parse(this);
  }

  bool isZero() {
    if (isEmpty) {
      return true;
    }
    return int.parse(this) == 0;
  }
}
