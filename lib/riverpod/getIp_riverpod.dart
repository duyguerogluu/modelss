import 'dart:io';
import 'package:flutter/material.dart';

class GetIpsRiverpod extends ChangeNotifier {
  Future<dynamic> printIpsRiverpod() async {
    for (var interface in await NetworkInterface.list()) {
      debugPrint('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        debugPrint(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} beş${addr.type.name}');
        String currentIp = addr.address;
        return currentIp;
      }
    }
    return '';
  }

  Future<String> returnIp() async {
    String ipAddress = await printIpsRiverpod();
    debugPrint("ıp" + ipAddress);
    return ipAddress;
  }
}
