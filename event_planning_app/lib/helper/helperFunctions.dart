import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String usernameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userdob = "USERDOB";
  // saving the data in shared preferences
  static Future<bool> savedUserLoggedInStatus(bool isUserloggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserloggedIn);
  }

  static Future<bool> savedUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(usernameKey, userName);
  }

  static Future<bool> savedUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> savedUserDOB(String userDOB) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userdob, userDOB);
  }
  // getting the data from shared preferences

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNamefromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(usernameKey);
  }

  static Future<String?> getUserDOB() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userdob);
  }
}
