import 'package:api_nasa_2/UI/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> getAplicationRoutes = {
  '/': (_) => HomePage(),
};
