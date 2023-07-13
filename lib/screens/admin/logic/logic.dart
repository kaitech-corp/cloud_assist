import '../../../models/user_model/user_model.dart';


int getNewUsers(List<UserModel> users) {
    final DateTime today = DateTime.now();
    int count = 0;
    for (final UserModel user in users) {
      if (user.dateCreated!.isAfter(today.subtract(const Duration(days: 7)))) {
        count++;
      }
    }
    return count;
  }

int getUserCount(List<UserModel> userList, DateTime date) {
  // Get the user data for the specified date
  List<UserModel> filteredUserList = userList.where((UserModel userModel) {
    // Filter by the dateCreated field
   final  DateTime? userModelDateCreated = userModel.dateCreated;
    if (userModelDateCreated != null) {
      // Consider only the date part of the DateTime objects
      return userModelDateCreated.year == date.year &&
          userModelDateCreated.month <= date.month &&
          // (date.day - 5) <= userModelDateCreated.day &&
          userModelDateCreated.day <= date.day;
    }
    return false;
  }).toList();

  // Reduce the filtered user data list to get the total user count
  int userCount = filteredUserList.length;

  return userCount;
}




class UserData {

  UserData(this.date, this.count);
  final DateTime date;
  final int count;
}
