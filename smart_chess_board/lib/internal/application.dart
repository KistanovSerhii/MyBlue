import 'package:flutter/material.dart';

import 'package:smart_chess_board/presentation/bluetooth_find_devices_screen.dart';
import 'package:smart_chess_board/presentation/bluetooth_off_screen.dart';

import 'package:flutter_blue/flutter_blue.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}
