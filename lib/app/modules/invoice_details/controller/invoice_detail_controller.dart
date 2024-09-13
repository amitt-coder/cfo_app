import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import '../../../data/api.dart';
import '../../../routes/app_pages.dart';

class InvoiceDetailController extends GetxController {
  RxString userName = ''.obs;
  RxString paymentDate = ''.obs;
  RxString crBalance = ''.obs;
  RxString whichDetail = ''.obs;
  RxString amountShow = ''.obs;
  RxString due_date = ''.obs;
  RxString invoiceId = ''.obs;

  TextEditingController descriptionController = TextEditingController();
  TextEditingController offerController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final selectedDate = DateTime.now().obs;
  List<dynamic> creditors=[];
  // var outstandingInvoices;
  var outstandingInvoices = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accountPayableApi();
    final args = Get.arguments as Map<String, dynamic>?;
    userName.value = args?['userName'] ?? 'DefaultUser';
    crBalance.value = args?['crBalance'] ?? 'DefaultUser';
    paymentDate.value = args?['paymentDate'] ?? 'DefaultUser';
    whichDetail.value = args?['whichDetail'] ?? 'DefaultUser';
    due_date.value = args?['due_date'] ?? 'DefaultUser';
    invoiceId.value = args?['invoiceId'] ?? "0";
    outstandingInvoices.value = args!['creditor']['outstanding_invoices'] ?? [];
    print('invoiceId ${invoiceId.value.toString()}');
    // print('crBalance ${crBalance.value}');
    // print('payment ${paymentDate.value}');
    print('whichDetail ${whichDetail.value}');
    invoiceGetApiCalling();
  }

  void invoiceGetApiCalling(){
    if(whichDetail.value == 'Debtor Details'){
      filter_debtors_discount();
    }else{
      filter_creditors_discount();
    }
  }


  Future<void> calendarOpen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDate.value = picked;
      String formattedDate =
          // DateFormat('dd-MM-yyyy').format(selectedDate.value);
          DateFormat('yyyy-MM-dd').format(selectedDate.value);
      dateController.text = formattedDate;
      print('selectedDate.value ${dateController.text}');
    }
  }

  double calculateRemainingPrice() {
    // Parse the discount percentage from offerController.text
    double discountPercentage = double.parse(offerController.text);

    // Remove commas from crBalance.value and parse as a double
    String cleanedCrBalance = crBalance.value.replaceAll(',', '');
    double totalPrice = double.parse(cleanedCrBalance);

    // Calculate the discount amount
    double discountAmount = (discountPercentage / 100) * totalPrice;

    // Calculate the remaining price after discount
    double remainingPrice = totalPrice - discountAmount;
    // Update amountShow with the remaining price
    amountShow.value = remainingPrice
        .toStringAsFixed(0); // Use toStringAsFixed for formatted output

    // Print the result for debugging
    print('Remaining Price after Discount: ${amountShow.value}');

    return remainingPrice;
  }

  Future<void> requestPermissions() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      // Handle the case where permission is not granted
      print('Storage permission denied');
    }
  }

  Future<Uint8List> loadImageFromFile(String path) async {
    final file = File(path);
    return await file.readAsBytes();
  }

  Future<Uint8List> loadImage(String imagePath) async {
    // If imagePath is base64 encoded, decode it
    if (imagePath.startsWith('data:image')) {
      final base64String = imagePath.split(',').last;
      return base64Decode(base64String);
    } else {
      // Otherwise, load image from assets
      final ByteData data = await rootBundle.load(imagePath);
      return data.buffer.asUint8List();
    }
  }

  Future<void> savePdfToSdCard(
    String filename,
  ) async {
    final pdf = pw.Document();

    // Request permissions if necessary (not implemented here)
    await requestPermissions();
    // Preload all images
    // final images = await Future.wait(
    //   ItemList2.map((item) async {
    //     final imageData = await loadImage(item.image);
    //     return pw.MemoryImage(imageData);
    //   }).toList(),
    // );
    // Generate PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Invoice',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.SizedBox(height: 20),
              pw.Text('From:'),
              pw.Text('Techpanda It Service',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.Text('Indore,M.P',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.Text('Phone: 123-456-7890',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.Text('Email:tp@gmail.com',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.SizedBox(height: 20),
              pw.Text('To:'),
              pw.Text('Client\'s Name ${userName.value}',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.Text('Client\'s Address Indore M.P',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.SizedBox(height: 20),
              pw.Text('Invoice Details:',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              pw.Text('Total Debit Balance: ${crBalance.value}',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.Text('Last Payment Date: ${paymentDate.value}',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.Text('Due Date: 01-31-2024',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
              pw.SizedBox(height: 20),
              pw.Text('Outstanding Invoices:',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              pw.Table(
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text('Invoice #',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      pw.Text('Amount',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      pw.Text('Due Date',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('12345',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('10,000',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('01-10-2024',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('12345',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('10,000',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('01-20-2024',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('12345',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('10,000',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('01-22-2024',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('12345',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('10,000',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('01-25-2024',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                    ],
                  ),pw.TableRow(
                    children: [
                      pw.Text('12345',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('10,000',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      pw.Text('01-27-2024',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                    ],
                  ),
                  // Repeat for other invoices if needed
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text('Discount: ${offerController.text.toString()}%',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  )
              ),
              pw.Text('Total Due: ${crBalance.value}',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  )
              ),
              pw.Text('Due Date: ${dateController.text.toString()}',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  )
              ),
              pw.SizedBox(height: 20),
              pw.Text('Contact Info:',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  )
              ),
              pw.Text('Phone: 123-456-7890',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  )
              ),
              pw.Text('Email: ${userName.value}@gmail.com',
                  style: pw.TextStyle(
                      color: PdfColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15
                  )
              ),
              pw.SizedBox(height: 20),
              pw.Text('Comment:',
              style: pw.TextStyle(
                color: PdfColors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal
              )
              ),
              pw.Text('${descriptionController.text.toString()}',
              style: pw.TextStyle(
                color: PdfColors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15
              )

              ),
            ],
          );
        },
      ),
    );

    /// Save PDF to SD card
    try {
      final sdCardPath = await getSdCardDownloadPath();
      final filePath = '$sdCardPath/$filename.pdf';
      final file = File(filePath);

      await file.writeAsBytes(await pdf.save());

      print('PDF saved at: $filePath');
      Get.snackbar(
        "Download",
        "$filePath",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      // Get.snackbar(
      //   "Not Download",
      //   "$e",
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor:Colors.red,
      //   colorText: Colors.white,
      //   duration: Duration(seconds: 3),
      // );

      print('Not Download: ${e}');
    }
  }

  Future<String> getSdCardDownloadPath() async {
    // For Android devices, external storage paths are device-specific
    // Try to access standard external directories
    if (Platform.isAndroid) {
      final directory = Directory('/storage/emulated/0/Download');
      if (await directory.exists()) {
        return directory.path;
      }

      // Check other potential paths if necessary
      // Example path for SD card might be something like '/storage/sdcard1/Download'
      final sdCardDirectory = Directory('/storage/sdcard1/Download');
      if (await sdCardDirectory.exists()) {
        return sdCardDirectory.path;
      }
    }

    // Fallback to application documents directory if not found
    final directory = await getApplicationDocumentsDirectory();
    final fallbackPath = '${directory.path}/Downloads';
    final dir = Directory(fallbackPath);

    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    return fallbackPath;
  }


  Future<dynamic> accountPayableApi() async {

    print('-------accountPayableApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);
    print('url:${Api.filter_creditors}${userId}');

    try {
      var response = await http.get(Uri.parse('${Api.filter_creditors}${userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);
        final Map<String, dynamic> creditor;
           creditors = responseData['creditor'] ?? [];

        for (var creditor in creditors) {
          var outstandingInvoices = creditor['outstanding_invoices'];
          // print('Creditor: ${creditor['name']} - Outstanding Invoices: ${outstandingInvoices}');
        }

        //
        // creditor=responseData['creditor'];
        //
        // var outstandingInvoices = creditor['outstanding_invoices'];
        // print('outstandingInvoices: ${outstandingInvoices}');
        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: ${e}');
      return e;
    }
  }

  Future<dynamic> debtorsDiscountApi() async {

    print('-------debtorsDiscountApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    Map<String, dynamic> requestBody = {
      "created_by_user":userId,
      "comment":descriptionController.text.toString(),
      "due_date":dateController.text.toString(),
      "total_due":amountShow.value.toString(),
      "offer":offerController.text.toString(),
      "debtor":invoiceId.value.toString()
    };

    String encodedBody = json.encode(requestBody);
    print('url:${Api.debtors_discount}');
    // print('url:${Api.creditors_discount}');
    print('encodedBody:${encodedBody}');

    try {
      var response =
        await http.post(Uri.parse('${Api.debtors_discount}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: encodedBody,
      );
      print('response Status ${response.statusCode}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        var responseData = json.decode(response.body);
        Get.offAllNamed(Routes.DASH_BOARD);
        print('response: ${responseData}');

        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: ${e}');
      return e;
    }
  }

  Future<dynamic> creditorDiscountApi() async {

    print('-------creditorDiscountApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    Map<String, dynamic> requestBody = {
      "created_by_user":userId,
      "comment":descriptionController.text.toString(),
      "due_date":dateController.text.toString(),
      "total_due":amountShow.value.toString(),
      "offer":offerController.text.toString(),
      "creditor":invoiceId.value.toString()
    };

    String encodedBody = json.encode(requestBody);
    // print('url:${Api.debtors_discount}');
    print('url:${Api.creditors_discount}');
    print('encodedBody:${encodedBody}');

    try {
      var response =
      await http.post(Uri.parse('${Api.creditors_discount}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: encodedBody,
      );
      print('response Status ${response.statusCode}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        var responseData = json.decode(response.body);
        Get.offAllNamed(Routes.DASH_BOARD);
        print('response: ${responseData}');

        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: ${e}');
      return e;
    }
  }

  Future<dynamic> filter_debtors_discount() async {

    print('-------filter_debtors_discount--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('${Api.filter_debtors_discount}${invoiceId.value}/');

    try {
      var response = await http.get(Uri.parse('${Api.filter_debtors_discount}${invoiceId.value}/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);
        print('responseData: $responseData');
        offerController.text = responseData['Debtors_discount']['offer'];
        dateController.text = responseData['Debtors_discount']['due_date'];
        descriptionController.text = responseData['Debtors_discount']['comment'];
        print('offer: ${offerController.text.toString()}');
        print('due_date: ${dateController.text.toString()}');
        print('comment: ${descriptionController.text.toString()}');

        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: ${e}');
      return e;
    }
  }

  Future<dynamic> filter_creditors_discount() async {

    print('-------filter_debtors_discount--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('${Api.filter_creditors_discount}${invoiceId.value}/');

    try {
      var response = await http.get(Uri.parse('${Api.filter_creditors_discount}${invoiceId.value}/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);
        print('responseData: $responseData');
        offerController.text = responseData['Creditors_discount']['offer'];
        dateController.text = responseData['Creditors_discount']['due_date'];
        descriptionController.text = responseData['Creditors_discount']['comment'];
        print('offer: ${offerController.text.toString()}');
        print('due_date: ${dateController.text.toString()}');
        print('comment: ${descriptionController.text.toString()}');

        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: ${e}');
      return e;
    }
  }

}
