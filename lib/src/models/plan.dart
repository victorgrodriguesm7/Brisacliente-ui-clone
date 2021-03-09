import 'package:flutter/material.dart';

class Plan {
  String title;
  String type;
  List<Map<String, dynamic>> options;

  Plan(this.title, String type, List<Map<String, dynamic>> options) {
    switch (type) {
      case "phone":
        this.type = "Telefone";
        break;
      case "tv":
        this.type = "TV";
        break;
      default:
        this.type = "Internet";
    }
    int i = 0;
    for (Map<String, dynamic> option in options) {
      IconData icon;

      switch (option["icon"]) {
        case "phone_forwarded":
          icon = Icons.phone_forwarded;
          break;
        case "lock_open":
          icon = Icons.lock_open;
          break;
        case "visibility_off":
          icon = Icons.visibility_off;
          break;
        case "settings_remote":
          icon = Icons.settings_remote;
          break;
        case "share":
          icon = Icons.share;
          break;
        case "devices":
          icon = Icons.devices;
          break;
        case "swap_vert":
          icon = Icons.swap_vert;
          break;
        case "globe":
          icon = Icons.language;
          break;
      }

      options[i]["icon"] = icon;
      i++;
    }

    this.options = options;
  }
}
