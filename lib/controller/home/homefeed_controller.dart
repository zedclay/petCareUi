import 'package:get/get.dart';
import 'package:petcare/core/functions/getToken.dart';
import 'package:petcare/core/services/services.dart';
import 'package:petcare/data/datasource/remote/pets/allpets.dart';
import 'package:petcare/data/models/pet.dart';
import 'package:petcare/views/screens/auth/auth.dart';

abstract class HomefeedController extends GetxController {
  changeCat(int index);
}

class HomefeedControllerImp extends HomefeedController
    with GetSingleTickerProviderStateMixin {
  int currentindex = 0;
  var disappearedPets = <Pet>[].obs;
  var foundPets = <Pet>[].obs;
  AllpetsData allpetsData = AllpetsData();

  @override
  void onInit() {
    fetchalldissapearedpets();
    fetchAllfoundpets();
    super.onInit();
  }

  @override
  void onReady() {
    fetchalldissapearedpets();
    fetchAllfoundpets();
    super.onReady();
  }

  @override
  changeCat(int index) {
    currentindex = index;
    if (currentindex == 0) {
      disappearedPets.clear();
      foundPets.clear();
      fetchalldissapearedpets();
      fetchAllfoundpets();
    } else if (currentindex == 1) {
      disappearedPets.clear();
      foundPets.clear();
      fetchDogsDissapeared();
      fetchDogsFound();
    } else {
      disappearedPets.clear();
      foundPets.clear();
      fetchCatsDissapeared();
      fetchCatsFound();
    }

    update();
  }

  signOut() {
    MyServices myServices = Get.find();
    myServices.sharedprefs.remove("token");
    Get.offAll(const Auth());
  }

  fetchalldissapearedpets() async {
    try {
      var fetchedPets = await allpetsData.getAlldissapearedPets();
      disappearedPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  fetchAllfoundpets() async {
    try {
      var fetchedPets = await allpetsData.getAllFoundPets();
      foundPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  fetchDogsDissapeared() async {
    try {
      var fetchedPets = await allpetsData.getDissapearedPetsByCategory("dog");
      disappearedPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  fetchDogsFound() async {
    try {
      var fetchedPets = await allpetsData.getFoundPetsByCategory("dog");
      foundPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  fetchCatsDissapeared() async {
    try {
      var fetchedPets = await allpetsData.getDissapearedPetsByCategory("cat");
      disappearedPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  fetchCatsFound() async {
    try {
      var fetchedPets = await allpetsData.getFoundPetsByCategory("cat");
      foundPets.assignAll(fetchedPets);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> handleRefresh() {
    return Future.delayed(const Duration(seconds: 1), () {
      fetchalldissapearedpets();
      fetchAllfoundpets();
    });
  }
}
