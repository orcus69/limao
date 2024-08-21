import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_localization_loader/src/http_asset_loader.dart';
import 'package:http/http.dart' as http;

class CustomHttpAssetLoader extends HttpAssetLoader {
  const CustomHttpAssetLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    String localeName = "pt-br";
    switch (locale.toLanguageTag()) {
      case "pt-BR":
        localeName = "pt-br";
        break;
      case "en-US":
        localeName = "en-us";
        break;
      case "es-ES":
        localeName = "es";
        break;
      case "fr-FR":
        localeName = "fr";
        break;
    }
    // log("$path$localeName.json");
    try {
      var url = Uri.parse("$path$localeName.json");
      return http
          .get(url)
          .then((response) => json.decode(utf8.decode(response.bodyBytes)));
    } catch (e) {
      return {"LANG": "zxdfzxc"};
    }
  }
}
