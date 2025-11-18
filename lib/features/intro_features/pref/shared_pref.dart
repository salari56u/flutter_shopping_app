import 'package:shared_preferences/shared_preferences.dart';

class Shared_Pref
{

  late SharedPreferences pref;
  Future<bool> getIntroStatus()async
  {
    pref =await SharedPreferences.getInstance();

    final bool status=pref.getBool('intro') ?? false;
    return status;
  }

  Future<void> setIntrostatus()async
  {
    pref=await SharedPreferences.getInstance();
    await pref.setBool('intro', true);
  }
}

