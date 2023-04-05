// ignore: file_names
bool validatePincode(String pincode) {
  // Check length
  if (pincode.length < 6) {
    return false;
  }

  // Ensure input contains only digits
  if (!RegExp(r'^\d+$').hasMatch(pincode)) {
    return false;
  }

  // Check for not having more than 2 consecutive repeating digits
  RegExp moreThanTwoRepeating = RegExp(r'(\d)\1{1,}');
  if (moreThanTwoRepeating.allMatches(pincode).length > 2) {
    return false;
  }

  // Check for not having more than 2 consecutive ascending or descending digits
  bool hasMoreThanTwoConsecutive = false;
  for (int i = 0; i < pincode.length - 2; i++) {
    int a = int.parse(pincode[i]);
    int b = int.parse(pincode[i + 1]);
    int c = int.parse(pincode[i + 2]);

    if ((b == a + 1 && c == b + 1) || (b == a - 1 && c == b - 1)) {
      hasMoreThanTwoConsecutive = true;

      break;
    }
  }
  if (hasMoreThanTwoConsecutive) {
    return false;
  }

  // Check for not having more than 2 repeated groups
  RegExp repeatedGroup = RegExp(r'(\d\d)(?=.*\1)');
  int repeatedGroupsCount = repeatedGroup.allMatches(pincode).length;

  if (repeatedGroupsCount > 1) {
    return false;
  }

  return true;
}
