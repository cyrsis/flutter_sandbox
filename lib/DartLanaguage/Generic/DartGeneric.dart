

import 'package:flutter_sandbox/DartLanaguage/Generic/cashier.dart';
import 'package:flutter_sandbox/DartLanaguage/Generic/manager.dart';
import 'package:flutter_sandbox/DartLanaguage/Generic/payroll.dart';

main(List<String> arguments) {

  Manager boss = new Manager();
  Cashier jill = new Cashier();

  Payroll payroll = new Payroll();
  payroll.add(boss);
  payroll.add(jill);

  payroll.print();

}
