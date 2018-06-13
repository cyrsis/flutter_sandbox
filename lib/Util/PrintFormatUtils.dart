//Probably would work on it later
//@DateTime

//import 'dart:typed_data';
//
//class PrintFormatUtils {
//  // 对齐方式
//   final int ALIGN_LEFT = 0;     // 靠左
//   final int ALIGN_CENTER = 1;   // 居中
//   final int ALIGN_RIGHT = 2;    // 靠右
//
//  //字体大小
//   final int FONT_NORMAL = 0;    // 正常
//   final int FONT_MIDDLE = 1;    // 中等
//   final int FONT_BIG = 2;       // 大
//
//  //加粗模式
//   final int FONT_BOLD = 0;              // 字体加粗
//   final int FONT_BOLD_CANCEL = 1;       // 取消加粗
//
//  /**
//   * 打印二维码
//   * @param qrCode
//   * @return
//   */
//   String getQrCodeCmd(String qrCode) {
//    List<int> data;
//
//    int store_len = qrCode.length + 3;
//    Uint8List store_pL =  (store_len % 256) as Uint8List;
//    Uint8List store_pH =  (store_len / 256) as Uint8List;
//
//
//    // QR Code: Select the model
//    //              Hex     1D      28      6B      04      00      31      41      n1(x32)     n2(x00) - size of model
//    // set n1 [49 x31, model 1] [50 x32, model 2] [51 x33, micro qr code]
//    // https://reference.epson-biz.com/modules/ref_escpos/index.php?content_id=140
//    List<int> modelQR = [0x1d, 0x28, 0x6b, 0x04, 0x00, 0x31, 0x41, 0x32, 0x00];
//
//    // QR Code: Set the size of module
//    // Hex      1D      28      6B      03      00      31      43      n
//    // n depends on the printer
//    // https://reference.epson-biz.com/modules/ref_escpos/index.php?content_id=141
//    List<int> sizeQR = [0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, 0x08];
//
//    //          Hex     1D      28      6B      03      00      31      45      n
//    // Set n for error correction [48 x30 -> 7%] [49 x31-> 15%] [50 x32 -> 25%] [51 x33 -> 30%]
//    // https://reference.epson-biz.com/modules/ref_escpos/index.php?content_id=142
//    List<int> errorQR = [0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x45, 0x31];
//
//    // QR Code: Store the data in the symbol storage area
//    // Hex      1D      28      6B      pL      pH      31      50      30      d1...dk
//    // https://reference.epson-biz.com/modules/ref_escpos/index.php?content_id=143
//    //                        1D          28          6B         pL          pH  cn(49->x31) fn(80->x50) m(48->x30) d1…dk
//    List<int> storeQR = [0x1d, 0x28, 0x6b, store_pL as int, store_pH as int, 0x31, 0x50, 0x30];
//
//    // QR Code: Print the symbol data in the symbol storage area
//    // Hex      1D      28      6B      03      00      31      51      m
//    // https://reference.epson-biz.com/modules/ref_escpos/index.php?content_id=144
//    List<int> printQR = [0x1d, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x51, 0x30];
//
//    data = byteMerger(modelQR, sizeQR);
//    data = byteMerger(data, errorQR);
//    data = byteMerger(data, storeQR);
//    data = byteMerger(data, qrCode as Uint8List );
//    data = byteMerger(data, printQR);
//
//    return data.toString();
//  }
//
//  /**
//   * 打印条码
//   * @param barcode
//   * @return
//   */
//   String getBarcodeCmd(String barcode) {
//    // 打印 Code-128 条码时需要使用字符集前缀
//    // "{A" 表示大写字母
//    // "{B" 表示所有字母，数字，符号
//    // "{C" 表示数字，可以表示 00 - 99 的范围
//
//
//    List<int> data;
//
//    String btEncode;
//
//    if (barcode.length < 18) {
//      // 字符长度小于15的时候直接输出字符串
//      btEncode = "{B" + barcode;
//    } else {
//      // 否则做一点优化
//
//      int startPos = 0;
//      btEncode = "{B";
//
//      for (int i = 0; i < barcode.length; i++) {
//        char curChar = barcode.charAt(i);
//
//        if (curChar < 48 || curChar > 57 || i == (barcode.length - 1)) {
//          // 如果是非数字或者是最后一个字符
//
//          if (i - startPos >= 10) {
//            if (startPos == 0) {
//              btEncode = "";
//            }
//
//            btEncode += "{C";
//
//            bool isFirst = true;
//            int numCode = 0;
//
//            for (int j = startPos; j < i; j++) {
//
//              if (isFirst) { // 处理第一位
//                numCode = (barcode.charAt(j) - 48) * 10;
//                isFirst = false;
//              } else { // 处理第二位
//                numCode += (barcode.charAt(j) - 48);
//                btEncode += (char) numCode;
//                isFirst = true;
//              }
//
//            }
//
//            btEncode += "{B";
//
//            if (!isFirst) {
//              startPos = i - 1;
//            } else {
//              startPos = i;
//            }
//          }
//
//          for (int k = startPos; k <= i; k++) {
//            btEncode += barcode.charAt(k);
//          }
//          startPos = i + 1;
//        }
//
//      }
//    }
//
//
//    // 设置 HRI 的位置，02 表示下方
//    List<int> hriPosition = [ 0x1d,  0x48,  0x02];
//    // 最后一个参数表示宽度 取值范围 1-6 如果条码超长则无法打印
//    List<int> width = [ 0x1d,  0x77,  0x02];
//    List<int> height = [ 0x1d,  0x68,  0xfe]};
//    // 最后两个参数 73 ： CODE 128 || 编码的长度
//    List<int> barcodeType = [0x1d,  0x6b,  73,  btEncode.length]};
//    List<int> print = [10,  0];
//
//    data = PrintFormatUtils.byteMerger(hriPosition, width);
//    data = PrintFormatUtils.byteMerger(data, height);
//    data = PrintFormatUtils.byteMerger(data, barcodeType);
//    data = PrintFormatUtils.byteMerger(data, btEncode.getBytes());
//    data = PrintFormatUtils.byteMerger(data, print);
//
//    return new String(data);
//  }
//
//  /**
//   * 切纸
//   * @return
//   */
//   String getCutPaperCmd() {
//    // 走纸并切纸，最后一个参数控制走纸的长度
//    List<int> data = { 0x1d,  0x56,  0x42,  0x15};
//
//    return new String(data);
//  }
//
//  /**
//   * 对齐方式
//   * @param alignMode
//   * @return
//   */
//   String getAlignCmd(int alignMode) {
//    List<int> data = { 0x1b,  0x61,  0x0};
//    if (alignMode == ALIGN_LEFT) {
//    data[2] =  0x00;
//    } else if (alignMode == ALIGN_CENTER) {
//    data[2] =  0x01;
//    } else if (alignMode == ALIGN_RIGHT) {
//    data[2] =  0x02;
//    }
//
//    return new String(data);
//  }
//
//  /**
//   * 字体大小
//   * @param fontSize
//   * @return
//   */
//   String getFontSizeCmd(int fontSize) {
//    List<int> data = { 0x1d,  0x21,  0x0};
//    if (fontSize == FONT_NORMAL) {
//    data[2] =  0x00;
//    } else if (fontSize == FONT_MIDDLE) {
//    data[2] =  0x01;
//    } else if (fontSize == FONT_BIG) {
//    data[2] =  0x11;
//    }
//
//    return new String(data);
//  }
//
//  /**
//   * 加粗模式
//   * @param fontBold
//   * @return
//   */
//   String getFontBoldCmd(int fontBold) {
//    List<int> data = [ 0x1b,  0x45,  0x0];
//
//    if (fontBold == FONT_BOLD) {
//    data[2] =  0x01;
//    } else if (fontBold == FONT_BOLD_CANCEL) {
//    data[2] =  0x00;
//    }
//
//    return data.toString();
//  }
//
//  /**
//   * 打开钱箱
//   * @return
//   */
//   String getOpenDrawerCmd() {
//    List<int> data = new List(4);
//    data[0] = 0x10;
//    data[1] = 0x14;
//    data[2] = 0x00;
//    data[3] = 0x00;
//
//    return data.toString();
//  }
//
//  /**
//   * 字符串转字节数组
//   * @param str
//   * @return
//   */
//   List<int> stringToBytes(String str) {
//    List<int> data = null;
//
//    try {
//      List<int> strBytes = str.getBytes("utf-8");
//
//      data = (new String(strBytes, "utf-8")).getBytes("gbk");
//    } catch (UnsupportedEncodingException exception) {
//    exception.printStackTrace();
//    }
//
//    return data;
//  }
//
//  /**
//   * 字节数组合并
//   * @param bytesA
//   * @param bytesB
//   * @return
//   */
//   List<int> byteMerger(List<int> bytesA, List<int> bytesB) {
//  List<int> bytes = new byte[bytesA.length + bytesB.length];
//  System.arraycopy(bytesA, 0, bytes, 0, bytesA.length);
//  System.arraycopy(bytesB, 0, bytes, bytesA.length, bytesB.length);
//  return bytes;
//  }
//}