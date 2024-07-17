import 'package:flutter/material.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/views/screens/home/clinic.dart';
import 'package:petcare/views/screens/home/home.dart';
import 'package:petcare/views/screens/home/profile.dart';
import 'package:petcare/views/screens/home/shop.dart';

List<Widget> pages = [
  const Home(),
  const Clinic(),
  const Shop(),
  const Profile()
];

List<String> catnames = ["All", "Dogs", "Cats"];
List<String> docpics = [AppImageAsset.doc1, AppImageAsset.doc2, AppImageAsset.doc3];
List<String> shoppics = [AppImageAsset.shop1, AppImageAsset.shop2, AppImageAsset.shop3];
