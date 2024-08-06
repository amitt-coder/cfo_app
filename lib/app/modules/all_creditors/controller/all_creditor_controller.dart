import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

import '../../customers/customer_screen.dart';

class AllCreditorController extends GetxController
    with GetSingleTickerProviderStateMixin {

  RxInt buttonSelect = 1.obs;
  RxString showCategory = 'Cateogory A'.obs;
  RxList<String> showCategoryList =
      ['Cateogory A', 'Cateogory B', 'Cateogory C'].obs;

  TextEditingController categoryController = TextEditingController();
  // Define three observable color variables for the buttons
  var buttonColor1 = Rx<Color>(AppColor.primaryColor);
  var buttonColor2 = Rx<Color>(AppColor.whiteColor);
  var buttonColor3 = Rx<Color>(AppColor.whiteColor);

  // Define default and selected colors
  final Color defaultColor = AppColor.whiteColor;
  final Color selectedColor = AppColor.primaryColor;
  RxString whichUser = ''.obs;
  late TabController tabController;

  List<Widget> listingScreens = [
    CustomerScreen(
      whichUser:Get.arguments['whichUser'] ?? '', //
    ),
    CustomerScreen(
      whichUser: Get.arguments['whichUser'] ?? '',
    ),
  ];

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    final args = Get.arguments as Map<String, dynamic>?;
    whichUser.value = args?['whichUser'] ?? 'DefaultUser';
  }

  // Method to toggle the color of the buttons
  void toggleColor(int buttonNumber) {
    buttonSelect.value = buttonNumber;

    if (buttonNumber == 1) {
      buttonColor1.value = selectedColor;
      buttonColor2.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 2) {
      buttonColor2.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 3) {
      buttonColor3.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor2.value = defaultColor;
    }
  }

  Future<void> requestPermissions() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      // Handle the case where permission is not granted
      print('Storage permission denied');
    }
  }

  Future<void> savePdfToSdCard(String filename) async {
    // Request permissions
    await requestPermissions();

    // Generate PDF
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World', style: pw.TextStyle(fontSize: 40)),
        ),
      ),
    );

    // Path to SD card's Download folder
    final sdCardPath = await getSdCardDownloadPath();
    final filePath = '$sdCardPath/$filename.pdf';
    final file = File(filePath);

    // Save PDF to SD card
    await file.writeAsBytes(await pdf.save());

    print('PDF saved at: $filePath');
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
}
