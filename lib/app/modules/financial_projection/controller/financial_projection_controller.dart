import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../data/api.dart';
import '../../../routes/app_pages.dart';

class FinancialProjectionController extends GetxController {


  RxBool firstCheck = false.obs;
  RxBool secondCheck = false.obs;
  RxBool thirdCheck = false.obs;
  RxBool addItem = false.obs;

  final selectedDate = DateTime.now().obs;
  final selectedDateFixedAssest = DateTime.now().obs;

  var items = <String, String>{}.obs;
  var variableCostItems = <String, String>{}.obs;
  var fixedassetSchedule = <String, Map<String, String>>{}.obs;

  //Discounting Factor controller
  TextEditingController discountRate = TextEditingController();
  TextEditingController growthRate = TextEditingController();

  //fixed cost controller
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  //variable cost controller
  TextEditingController variableCostNameController = TextEditingController();
  TextEditingController variableCostmPriceController = TextEditingController();
  //fixed assets schedule controller
  TextEditingController assetsNameController = TextEditingController();
  TextEditingController assetDateController = TextEditingController();
  TextEditingController assetsCostController = TextEditingController();
  TextEditingController assetsdrController = TextEditingController();



  void checkCondition() {
    print('checkCondition ${firstCheck.value}');
    // firstCheck.value=!firstCheck.value;
    print('checkCondition2 ${firstCheck.value}');
    if (firstCheck == false) {
      firstCheck.value = true;
    } else {
      // secondCheck.value=true;
      print('checkCondition3 ${secondCheck.value}');
      if (secondCheck == false) {
        secondCheck.value = true;
      } else {
        thirdCheck.value = true;
      }
    }
  }

  void addItems() {

    print('addItem1: ${addItem.value}');

    addItem.value =! addItem.value;

    print('addItem2: ${addItem.value}');
  }

  void addItemAmount(String name, String price) {
    print('addItemAmount');
    if (name.isNotEmpty && price.isNotEmpty) {
      items[name] = price;
    }
    print('Added items $items');
  }

  void editItem(String oldName, String newName, String newPrice) {
    if (items.containsKey(oldName)) {
      items.remove(oldName);
      items[newName] = newPrice;
    }
  }

  void deleteItem(String name) {
    items.remove(name);
  }

  void addvariableCostItems(String name, String price) {
    print('addItemAmount');
    if (name.isNotEmpty && price.isNotEmpty) {
      variableCostItems[name] = price;
    }
    print('Added items $variableCostItems');
  }

  void editvariableCostItems(String oldName, String newName, String newPrice) {
    if (variableCostItems.containsKey(oldName)) {
      variableCostItems.remove(oldName);
      variableCostItems[newName] = newPrice;
    }
  }

  void deletevariableCostItems(String name) {
    variableCostItems.remove(name);
  }

  Future<void> calendarOpen(BuildContext context,) async {
    print('Calendar Open');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
       selectedDate.value  = picked;
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate.value);

      print('formattedDate $formattedDate');

      dateController.text= formattedDate;
      print('selectedDate.value ${dateController.text}');

    }
  }

  Future<void> FixedAssestcalendarOpen(BuildContext context,) async {
    print('Calendar Open by FixedAssestcalendarOpen ');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateFixedAssest.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDateFixedAssest.value  = picked;
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDateFixedAssest.value);

      print('formattedDate $formattedDate');

       assetDateController.text= formattedDate;
      print('assetDateController.value ${assetDateController.text}');

    }
  }

  Future<dynamic> FixedCostApi() async {

    print('-------FixedCostApi--------');

    final storage = GetStorage();

      String? token = storage.read('accessToken');
      String? userId = storage.read('USER_ID');


      try{

        var response = await http.post(Uri.parse(Api.FixedCost),
        headers: {
          'Content-Type':'application/json',
          'Authorization':'Bearer $token'
        },
          body: json.encode({
            'created_by_user':userId,
            'item':itemNameController.text.toString(),
            'amount_monthly':itemPriceController.text.toString(),
          }),
        );

        print('status ${response.statusCode}');

        if(response.statusCode == 200|| response.statusCode== 201){
          print('api successfully work');
          var responseData = json.decode(response.body);

          print('responseData: ${responseData}');
              return responseData;
        }else{
          print('Failed with status Code: ${response.statusCode}');
          return response.statusCode;
        }

      } on http.ClientException catch (e) {
        print('Client Exception: $e');
        return 'ClientException: $e';
      } on Exception catch (e) {
        print('Error: $e');
        return 'Exception: $e';
      }

  }

  Future<dynamic> VariableCostApi() async {

    print('------VariableCostApi------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    try{
      print('items: ${variableCostNameController.text.toString()}');
      print('amount_monthly: ${variableCostmPriceController.text.toString()}');
      print('created_by_user: ${userId}');
      var response = await http.post(Uri.parse(Api.VariableCost),
      headers: {
        'Content-Type':'application/json',
        'Authorization':'Bearer $token'
      },

        body: json.encode({
          'created_by_user':userId,
          'item':variableCostNameController.text.toString(),
          'amount_monthly':variableCostmPriceController.text.toString(),
        }),
      );

      print('response: ${response.statusCode}');

      if(response.statusCode == 200 || response.statusCode == 201){
        print('api successfully work');
        var responseData = json.decode(response.body);

        print('responseData: ${responseData}');
        return responseData;
      }else{
        print('Failed to statusCode ${response.statusCode}');
        return response.statusCode;
      }
    }catch(e){
      print('Error: $e');
    }
  }

  Future<dynamic> fixedAssetSchedule() async {

    print('------FixedAssetScheduleApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');


    try{
      var response = await http.post(
        Uri.parse(Api.FixedAssetSchedule),
        headers: {
          'Content-Type':'application/json',
          'Authorization':'Bearer $token'
        },
        body: json.encode({
        'created_by_user':userId,
        'assets':assetsNameController.text.toString(),
        'purchase_date':assetDateController.text.toString(),
        'cost':assetsCostController.text.toString(),
        'd_r':assetsdrController.text.toString(),
      }),
      );

      print('statusCode: ${response.statusCode}');

      if(response.statusCode == 200 || response.statusCode == 201){

        var responseData = json.decode(response.body);
        print('api successfully work');
        print('responseData: ${responseData}');

        return responseData;
      }else{
        print('Failed to error StatusCode ${response.statusCode}');
        return response.statusCode;
      }
    }catch(e){
      print('Error: $e');
    }
  }

  Future<dynamic> DiscountingFactorApi() async {

    print('------DiscountingFactorApi-------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    try{

      var response = await http.post(
          Uri.parse(
        Api.DiscountingFactor),
        headers:{
          'Content-Type':'application/json',
          'Authorization':'Bearer $token'
        },
        body: json.encode({
          'created_by_user':userId,
          'discount_rate':discountRate.text.trim().toString(),
          'growth_rate':growthRate.text.trim().toString(),
        })
      );

      print('statusCode: ${response.statusCode}');

      if(response.statusCode == 200 || response.statusCode == 201){

        var responseData = json.decode(response.body);
        print('api successfully work');

        print('responseData: ${responseData}');
        Get.offNamed(Routes.FINACIAL_PROJECTION_SUMMARY);
        return responseData;
      }else{
        print('Failed to statusCode: ${response.statusCode}');
        return response.statusCode;
      }
    }catch(e){
      print('Error: $e');
      return e;
    }
  }


  void fixedAssetsItem(String name, String purchaseDate, String cost, String dr) {
    print('fixedAssetsItem');
    if (name.isNotEmpty && purchaseDate.isNotEmpty && cost.isNotEmpty && dr.isNotEmpty) {
      fixedassetSchedule[name] = {
        'P.Date': purchaseDate,
        'Cost': cost,
        'DR': dr,
      };
    }
    print('Added items $fixedassetSchedule');
  }

  void editAsset(String oldName,String newName,
      String newPurchaseDate,String newCost,String newDr) {
    if (fixedassetSchedule.containsKey(oldName)) {
      fixedassetSchedule.remove(oldName);
      fixedassetSchedule[newName] = {
        'P.Date': newPurchaseDate,
        'Cost': newCost,
        'DR': newDr,
      };
    }
  }

  void deleteAsset(String name) {
    fixedassetSchedule.remove(name);
  }

}
