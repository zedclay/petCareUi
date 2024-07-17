import 'package:get/get.dart';
import 'package:petcare/data/datasource/remote/pets/allpets.dart';
import 'package:petcare/data/models/pet.dart';

abstract class SeealldController extends GetxController {
}

class SeealldControllerImp extends SeealldController{
  
  var disappearedPets = <Pet>[].obs;
  AllpetsData allpetsData = AllpetsData();

  @override
  void onInit() {
    fetchalldissapearedpets();
    super.onInit();
  }

  @override
  void onReady() {
    fetchalldissapearedpets();
    super.onReady();
  }



  fetchalldissapearedpets() async {
    try {
      var fetchedPets = await allpetsData.getAlldissapearedPets();
      disappearedPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }




}
