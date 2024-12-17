import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:trade_app/utils/app_const/app_const.dart';
import 'api_url.dart';

class SocketApi {
  // Singleton instance of the class
  factory SocketApi() {
    return _socketApi;
  }

  // Private constructor for singleton
  SocketApi._internal();

  static late io.Socket socket;

  ///<------------------------- Socket Initialization with dynamic User ID ---------------->

  static Future<void> init() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString(AppConstants.userId)??"";
    if (userId.isEmpty || userId == "null") {
      debugPrint('Socket Connected >>>>>>>>>>>> FALSE <<<<<<<<<<<<');
      return;
    }
    socket = io.io(
      ApiUrl.socketUrl(userID: userId),
      io.OptionBuilder()
          .setTransports(['websocket'])    // Set the transport to WebSocket
          .enableAutoConnect()              // Enable automatic connection on initialization
          .setReconnectionDelay(2000)       // Delay between reconnection attempts (2000 ms)
          .setReconnectionAttempts(0)       // Unlimited reconnection attempts (0 = unlimited)
          .setTimeout(5000)                 // Set connection timeout (5000 ms)
          .build(),
    );

    debugPrint('$userId=============> Socket initialization, connected: ${socket.connected}');

    // Listen for socket connection
    socket.onConnect((_) {
      debugPrint('==============>>>>>>> Socket Connected ${socket.connected} ===============<<<<<<<');
    });

    // Listen for unauthorized events
    socket.on('unauthorized', (dynamic data) {
      debugPrint('Unauthorized');
    });

    // Listen for errors
    socket.onError((dynamic error) {
      debugPrint('Socket error: $error');
    });

    // Listen for disconnection
    socket.onDisconnect((dynamic data) {
      debugPrint('>>>>>>>>>> Socket instance disconnected <<<<<<<<<<<<$data');
      reconnect();
    });
  }

  // Method to reconnect if disconnected
  static void reconnect() {
    if (!socket.connected) {
      debugPrint('Attempting to reconnect...');
      socket.connect();
    }
  }

  // Static instance of the class
  static final SocketApi _socketApi = SocketApi._internal();
}