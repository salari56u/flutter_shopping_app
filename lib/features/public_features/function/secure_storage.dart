import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageClass
{
  Future<String?> getusertoken()async
  {
    final token=await FlutterSecureStorage().read(key: 'token');
    return token;
  }
  Future<void> saveusertoken(token)async
  {
   await  const  FlutterSecureStorage().write(key: 'token',value: token);
  }
  Future<void> deleteusertoken(token)async
  {
    const  FlutterSecureStorage().delete(key: 'token');
  }
}