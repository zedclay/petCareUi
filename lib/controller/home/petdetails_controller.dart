import 'package:get/get.dart';
import 'package:petcare/data/datasource/remote/pets/petdetails.dart';
import 'package:petcare/data/models/pet.dart';

class PetdetailsController extends GetxController {
  Petdetails petdetailsdata = Petdetails();

  var pet = Pet(id: 0).obs; // Initialize with a default pet object

  @override
  void onInit() {
    if (Get.arguments["section"] == "found") {
      fetchFoundPetById(Get.arguments["id"]);
    } else {
      fetchDisappearedPetById(Get.arguments["id"]);
    }

    super.onInit();
  }

  Future<void> fetchDisappearedPetById(int id) async {
    try {
      Pet fetchedPet = await petdetailsdata.getdissapearedPetById(id);
      pet.value = fetchedPet;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> fetchFoundPetById(int id) async {
    try {
      Pet fetchedPet = await petdetailsdata.getFoundPetById(id);
      pet.value = fetchedPet;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deleteDisappearedPetById(int id) async {
    try {
      await petdetailsdata.deletedissapearedPetById(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deleteFoundPetById(int id) async {
    try {
      await petdetailsdata.deletefoundPetById(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
