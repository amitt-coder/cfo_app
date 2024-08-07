import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../utils/images.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class CustomerController extends GetxController {


  RxList<Items> ItemList = [
    Items(
        Name: "Vishal",
        image: ProjectImages.a_category,
        Db: '-2000',
        LP: '01-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Arpit",
        image: ProjectImages.b_category,
        Db: '+5000',
        LP: '10-05-2024',
        CINFO: '123-4'),
    Items(
        Name: "Akshay",
        image: ProjectImages.c_category,
        Db: '-8000',
        LP: '11-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Pankaj",
        image: ProjectImages.a_category,
        Db: '+7000',
        LP: '14-09-2024',
        CINFO: '123-4'),
    Items(
        Name: "Suresh",
        image: ProjectImages.b_category,
        Db: '-3000',
        LP: '05-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Shekhar",
        image: ProjectImages.c_category,
        Db: '+4000',
        LP: '06-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Sagar",
        image: ProjectImages.a_category,
        Db: '-6000',
        LP: '02-11-2024',
        CINFO: '123-4'),
    Items(
        Name: "Agam",
        image: ProjectImages.b_category,
        Db: '+9000',
        LP: '12-12-2024',
        CINFO: '123-4'),
  ].obs;

  RxList<Items> ItemList2 = [
    Items(
        Name: "Mohit",
        image: ProjectImages.a_category,
        Db: '-6000',
        LP: '01-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Amit.",
        image: ProjectImages.b_category,
        Db: '+5000',
        LP: '10-05-2024',
        CINFO: '123-4'),
    Items(
        Name: "Divy.",
        image: ProjectImages.c_category,
        Db: '+7000',
        LP: '11-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Ashok.",
        image: ProjectImages.a_category,
        Db: '-8000',
        LP: '14-09-2024',
        CINFO: '123-4'),
    Items(
        Name: "Aman.",
        image: ProjectImages.b_category,
        Db: '+4000',
        LP: '05-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Dipak",
        image: ProjectImages.c_category,
        Db: '+5500',
        LP: '05-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Tarun",
        image: ProjectImages.a_category,
        Db: '-6000',
        LP: '08-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Shubham",
        image: ProjectImages.b_category,
        Db: '+9000',
        LP: '15-06-2024',
        CINFO: '123-4'),
  ].obs;

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
    final images = await Future.wait(
      ItemList2.map((item) async {
        final imageData = await loadImage(item.image);
        return pw.MemoryImage(imageData);
      }).toList(),
    );
    // Generate PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Center(
              child: pw.Text(
                filename,
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              padding:const  pw.EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: pw.BoxDecoration(
                color:const  PdfColor.fromInt(0xFFE3F2FD),
                borderRadius: pw.BorderRadius.circular(5),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Cat.',
                      style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black)),
                  pw.Text('Name',
                      style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black)),
                  pw.Text('Cr.Bal',
                      style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black)),
                  pw.Text('L.T Date',
                      style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black)),
                  pw.Text('C.info',
                      style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black)),
                ],
              ),
            ),
            pw.ListView.builder(
              itemCount: ItemList2.length,
              itemBuilder: (pw.Context context, int index) {
                return pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Column(
                    children: [
                      pw.SizedBox(height: 5),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Image(
                            images[index],
                            height: 25,
                            width: 25,
                          ),
                          pw.Text(
                            ItemList2[index].Name,
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          pw.Text(
                            ItemList2[index].Db,
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          pw.Text(
                            ItemList2[index].LP,
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          pw.Text(
                            ItemList2[index].CINFO,
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      pw.Divider(
                        color: const PdfColor.fromInt(0xff808D9D),
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

    // Save PDF to SD card
    final sdCardPath = await getSdCardDownloadPath();
    final filePath = '$sdCardPath/$filename.pdf';
    final file = File(filePath);

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

class Items {
  String Name;
  String image;
  String Db;
  String LP;
  String CINFO;
  Items({
    required this.Name,
    required this.image,
    required this.Db,
    required this.LP,
    required this.CINFO,
  });
}
