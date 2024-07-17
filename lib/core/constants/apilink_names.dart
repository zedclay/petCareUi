class ApiLinkNames {
  static const server = "http://10.0.3.2:8000";
  static const serverimages =
      "http://10.0.3.2:8000/";
  static const test = "$server/test.php";
// ======================Images==================================

// ======================AUTH==================================
  static const signup = "$server/api/sign-up";
  static const signin = "$server/api/sign-in";
  static const editprofile = "$server/api/edit-profile";
  static const changepass = "$server/api/change-password";

// ======================Petdoctors==================================
  static const allDocs = "$server/api/pet-doctors";
  static const addDoc = "$server/api/pet-doctors";
// ======================petSupplies==================================
  static const allsuppliers = "$server/api/pet-suppliers";
  static const addsuppliers = "$server/api/pet-suppliers";

// ======================Home==================================
  static const home = "$server/home";
  static const alldisspearedpets = "$server/api/disappeared-pets";
  static const allfoundpets = "$server/api/found-pets";
  static const dissapearedFilteredPets = "$server/api/disappeared-pets/filter";
  static const foundFilteredPets = "$server/api/found-pets/filter";
}
