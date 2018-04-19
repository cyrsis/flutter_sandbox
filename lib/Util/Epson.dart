import 'dart:io';

class Epson {
  String ip;
  String data;

  Epson(this.ip, this.data);

  void init() {
    data += "\x1B\0x21\0x01"; //INIT=[0x1B][0x21][0x01]
  }

  void DHON() {
    data += "\0x1B\0x21\0x11\0x1C\0x21\x08";
  }

  void DHOFF() {
    data += "\0x1B\0x21\0x01\0x1C\0x21\x00";
  }

  void QSON() {
    data += "\0x1B\0x21\0x31\0x1C\0x21\0x0C";
  }

  void QSOFF() {
    data += "\0x1B\0x21\0x01\0x1C\0x21\0x00";
  }

  void BLODON() {
    data += "\0x1B\0x45\0x01";
  }

  void BLODOFF() {
    data += "\0x1B\0x45\0x00";
  }

  void FF() {
    data += "\0x1B\0x4A";
  }

  void FB() {
    data += "\0x1B\0x4B";
  }

  void REVON() {
    data += "\0x1D\0x42\0x01";
  }

  void REVOFF() {
    data += "\0x1D\0x42\0x00";
  }

  void REDON(){
    data +="\0x1B\0x72\0x01";
  }
  void REDOFF(){
    data +="\0x1B\0x72\0x00";
  }

  void AddString(String temp) {
    data += temp;
  }

  void LineFeed() {
    data += "\x0A";
  }

  void OpenDrawer() {
    data = "";
    data += "\0x1B\0x70\0x30\0x37\0x79";
    write();
  }

  void PartialCut() {
    data += "\x1D\x56\x31";
  }

  void FullCut() {
    data += "\x1D\x56\x30";
  }

  void Cut() {
    data += "\x1D\x56\x42\x00";
  }


  void DWON() {
    data += "\x1B\x21\x21\0x1C\0x21\04]";
  }

  void BarCode(){
    data +="\x1D\x48\x02";
    data +="\x1d\x6b\x41\x0C";
    data +="098765432198\x0A";
  }

  void QRCode(){

    String BarcodeContent = "123456789012345678901234567890"
        + "abcedfghijklmnopqrstuvwxyzabcd"
        + "123456789012345678901234567890"
        + "abcedfghijklmnopqrstuvwxyzabcd"
        + "123456789012345678901234567890"
        + "abcedfghijklmnopqrstuvwxyzabcd";

//            \\x1D, 0x28, 0x6B, 0xB7, 0x00, 0x31, 0x50, 0x30
//    data += "\x1D\x28\x6B\xB7\x00\x31\x50\x30"; //storeQrcode
//    data += BarcodeContent;

    data +=''''\x1D\x28\x6B\x83\x00\x31\x50\x30\x41\x42\x31\x31\x32\x32\x33\x33\x34\x34\x31\x30\x32\x30\x39\x32\x36\x39
    \x39\x39\x39\x30\x30\x30\x30\x30\x31\x34\x35\x30\x30\x30\x30\x30\x31\x35\x34\x30\x39\x38\x37\x36\x35\x34
    \x33\x31\x32\x33\x34\x35\x36\x37\x38\x79\x64\x58\x5A\x74\x34\x4C\x41\x4E\x31\x55\x48\x4E\x2F\x6A\x31
    \x6A\x75\x56\x63\x52\x41\x3D\x3D\x3A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x3A\x34\x3A\x34 \x3A\x31\x3A\xB0\xAE\xB9\x71\xA6\xC0\x3A\x31\x3A\x31\x30\x35\x3A\xA4\x66\xB8\x6E\x3A\x31\x3A\x32
    \x31\x30\x3A\xA4\xFB\xA5\xA4\x3A\x31\x3A\x32\x35''';

    data += "\x1D\x28\x6B\x03\x00\x31\x51\x30"; //print it out


  }

  void write() {
    Socket
        .connect(ip, 9100, timeout: new Duration(seconds: 200))
        .then((socket) {
      socket.write(data);

      socket.close();
    });
  }
}
