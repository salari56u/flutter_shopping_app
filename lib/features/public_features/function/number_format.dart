import 'package:intl/intl.dart';

final formatpattern=NumberFormat('###,###,###');

String getprice(price)
{
  return formatpattern.format(double.parse(price));
}