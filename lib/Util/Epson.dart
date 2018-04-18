import 'dart:io';

class Epson {
  String ip;
  String data ;
  Epson(this.ip,data);

  void connect() {
    Socket.connect(ip, 9100 , timeout: new Duration(seconds: 10)  ).then((socket) {
      socket.write(data);
      socket.write("\x0A \x0A \x1B@\x1DV1");
      socket.close();
    });
  }

}