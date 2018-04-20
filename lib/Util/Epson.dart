import 'dart:io';

import 'dart:typed_data';

class Epson {
  String ip;
  String data;

  Epson(this.ip, this.data) ;

  void init() {
    data += "\x1B\x40 Printer Connected"; //Initialize printer
  }

  void UsingBitValueTables() {
    data += "\x1B\x21\x01"; //INIT=[0x1B][0x21][0x01]
  }

  void DHON() {
    data += "\x1B\x21\x11\x1C\x21\x08";
  }

  void DHOFF() {
    data += "\x1B\x21\x01\x1C\x21\x00";
  }

  void QSON() {
    data += "\x1B\x21\x31\x1C\x21\x0C";
  }

  void QSOFF() {
    data += "\x1B\x21\x01\x1C\x21\x00";
  }

  void BLODON() {
    data += "\x1B\x45\x01";
  }

  void BLODOFF() {
    data += "\x1B\x45\x00";
  }

  void FF() {
    data += "\x1B\x4A";
  }

  void FF2() {
    data += "\x0C"; //Print and return to standard mode (in page mode)
  }

  void FB() {
    data += "\x1B\x4B";
  }

  void REVON() {
    data += "\x1D\0x42\0x01";
  }

  void EnableSmoothMode() {
    //GS b n
    //Turn smoothing mode on/off
    data += "\x1D\x62\x01";
  }

  void CharacterStandardSize() {
    //GS ! n
    data += "\x1D\x21\x00";
  }

  void CharacterDoubleWidthDoubleHeight() {
    // GS ! n
    data += "\x1D\x21\x11";
  }

  void WhiteBlackReverse() {
    //GS B n
    data += "\x1D\x42\x00";
  }

  void PrintLogo() {
    //GS ( L pL pH m fn kc1 kc2 x y keycode 32, 32
    //GS ( L  =  Print the specified NV graphics data    <Function 69>
//    pL    =    6
//    pH  =  0
//    m  =  48
//    fn  =  49
//    kc1  =  32
//    kc2  =  32
//    x  =  1
//    y  =  1
    data += "\x1D\x28\x4C\x06\x00\x30\x45\x20\x20\x01\x01";
  }

  void REVOFF() {
    data += "\0x1D\0x42\0x00";
  }

  void REDON() {
    data += "\0x1B\0x72\0x01";
  }

  void REDOFF() {
    data += "\0x1B\0x72\0x00";
  }

  void AddString(String temp) {
    data += temp;
  }

  void LineFeed() {
    data += "\x0A";
  }

  void OpenDrawer() {
    data = "";
    data += "\x1B\x70\x30\x37\x79";
    write();
  }

  void OpenDrawer2() {
    data = "";
    data += "\x10\x14\x01\x00\x01";
  }

  void PartialCut() {
    data += "\x1D\x56\x31";
  }

  void PageMode() {
    //52mm x 90mm
    data += "\x1B\x4C"; //page mode
    data += "\x1D\x50\x00\xCB"; //203 dpi for T70II
    data += "\x1B\x57\x00\x00\x00\x00\xA0\x01\x58\x02";
    data += "\x1B\x54\x00"; //Print it out
  }

  void FullCut() {
    data += "\x1D\x56\x30";
  }

  void Cut() {
    data += "\x1D\x56\x42\x00";
  }

  void DWON() {
    data += "\x1B\x21\x21\x1C\x21\x04";
  }

  void BarCode() {
    data += "\x1D\x48\x02"; //n  =  2  印在下方
    data += "\x1d\x6b\x41\x0C";
    data += "098765432198\x0A";
  }

  void BiteTest(){
    ByteData bytes = { \x1D, \x56, \x42, \x00 };
  }

  void QRCode3() {
    //data +="\x1D\x28\x6B\x83\x00\x31\x50\x30";
    data += "\x1D\x28\x6B\xB7\x00\x31\x50\x30" +
        "@123456789012345678901234567890" +
        "abcedfghijklmnopqrstuvwxyzabcd" +
        "123456789012345678901234567890" +
        "abcedfghijklmnopqrstuvwxyzabcd" +
        "123456789012345678901234567890" +
        "abcedfghijklmnopqrstuvwxyzabcd@" +
        "\x1D\x28\x6B\x03\x00\x31\x51\x30" +
        "\x1D\x56\x42\x00";
//    data += "\x1D\x28\x6B\x03\x00\x31\x51\x30";
//    data +="\x1D\x56\x42\x00";
  }

  void QRCode() {
    PageMode();
//            \\x1D, 0x28, 0x6B, 0xB7, 0x00, 0x31, 0x50, 0x30
//    data += "\x1D\x28\x6B\xB7\x00\x31\x50\x30"; //storeQrcode
//    data += BarcodeContent;

    //GS ( k <Function 165>    QR Code: Select the model
    // 1D 28 6B 04 00 31 41 32 00
    data += "\x1D\x28\x6B\x04\x00\x31\x41\x32\x00";

    //GS ( k <Function 167>  QR Code: Set the size of module
    //1D 28 6B 03 00 31 43 03
    data += "\x1D\x28\x6B\x03\x00\x31\x43\x03";

    //1D 28 6B 03 00 31 45 31
    //GS ( k <Function 169>  QR Code: Select the error correction level
    data += "\x1D\x28\x6B\x03\x00\x31\x45\x31";

//    GS ( k <Function 180>  QR Code: Store the data in the symbol storage area
    data += "\x1D\x28\x6B\x83\x00\x31\x50\x30\x41\x42\x31\x31\x32\x32\x33\x33\x34\x34\x31\x30\x32\x30\x39\x32\x36\x39" +
        "\x39\x39\x39\x30\x30\x30\x30\x30\x31\x34\x35\x30\x30\x30\x30\x30\x31\x35\x34\x30\x39\x38\x37\x36\x35\x34" +
        "\x33\x31\x32\x33\x34\x35\x36\x37\x38\x79\x64\x58\x5A\x74\x34\x4C\x41\x4E\x31\x55\x48\x4E\x2F\x6A\x31" +
        "\x6A\x75\x56\x63\x52\x41\x3D\x3D\x3A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x2A\x3A\x34\x3A\x34" +
        "\x3A\x31\x3A\xB0\xAE\xB9\x71\xA6\xC0\x3A\x31\x3A\x31\x30\x35\x3A\xA4\x66\xB8\x6E\x3A\x31\x3A\x32" +
        "\x31\x30\x3A\xA4\xFB\xA5\xA4\x3A\x31\x3A\x32\x35";

    // 1D 28 6B 03 00 31 51 30
    data += "\x1D\x28\x6B\x03\x00\x31\x51\x30"; //print it out
  }

  void QRCode2() {
    //[0x1B][0x40]
//    [0x1D][0x28][0x6B][0x03][0x00][0x31][0x43][0x04]
//    [0x1D][0x28][0x6B][0x03][0x00][0x31][0x45][0x33]
//    [0x1D][0x28][0x6B][0x19][0x00][0x31][0x50][0x30]
//    [0x43][0x49][0x52][0x43][0x4C][0x45][0x4B][0x30][0x31][0x32][0x33][0x34][0x35][0x36][0x37][0x38][0x39][0x36][0x37][0x38][0x39]
//    [0x1D][0x28][0x6B][0x03][0x00][0x31][0x51][0x30]

    data += "Test(ting QRcode";
    data += "\x1B\x40" +
        "\x1D\x28\x6B\x03\x00\x31\x43\x04" +
        "\x1D\x28\x6B\x03\x00\x31\x45\x33" +
        "\x1D\x28\x6B\x19\x00\x31\x50\x30" +
        "\x43\x49\x52\x43\x4C\x45\x4B\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39\x36\x37\x38\x39" +
        "\x1D\x28\x6B\x03\x00\x31\x51\x31";
  }

  void write() {
    Socket
        .connect(ip, 9100, timeout: new Duration(seconds: 2000))
        .then((socket) {
      socket.write(data);

      socket.close();
    });
  }
}
