import 'dart:io';

class Epson {
  String ip;
  String data ;
  Epson(this.ip,data);

  //echo -e "\x1B@\x1DV1" | nc printer.ip 9100
  void connect() {
    Socket.connect(ip, 9100 , timeout: new Duration(seconds: 10)  ).then((socket) {

      socket.write("\x1D@\x56@\x42@\x00");
      socket.write("\x1D@\x28@\x6B@\xB7@\x00@\x31@\x50@\x30");
      socket.write("123456789012345678901234567890"
      + "abcedfghijklmnopqrstuvwxyzabcd"
      + "123456789012345678901234567890"
      + "abcedfghijklmnopqrstuvwxyzabcd"
      + "123456789012345678901234567890"
      + "abcedfghijklmnopqrstuvwxyzabcd");
      socket.write("\x1D@\x28@\x6B@\x03@\x00@\x31@\x51@\x30");
      socket.close();
    });
  }

}