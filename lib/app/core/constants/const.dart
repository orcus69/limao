import 'package:caracolibras/app/core/constants/permissions.dart';
import 'package:hive/hive.dart';

class AppConst {
  AppConst._privateConstructor();

  static final AppConst _instance = AppConst._privateConstructor();

  factory AppConst() {
    return _instance;
  }

  static const double imageH = 18;

  static double sidePadding = 20;
  static double sideWindowWidth = 450;
  static double borderRadius = 10;

  static String getDefaultStorage() {
    var boxData = Hive.box("data");
    var appData = Map<String, dynamic>.from(boxData.get("appData") ?? {});
    return appData["storage"] ??
        "https://storage.googleapis.com/dailyexpenses/";
  }

  static String getFullName() {
    var boxData = Hive.box("data");
    var appData = Map<String, dynamic>.from(boxData.get("appData") ?? {});
    var userData = Map<String, dynamic>.from(appData["user"] ?? {});
    return userData["name"] ?? "Teste";
  }

  static Map getDefaultPermissions() {
    var boxData = Hive.box("data");
    var appData = Map<String, dynamic>.from(boxData.get("appData") ?? {});
    return appData["permission"] ?? {};
  }

  static Map? getCommissionManager() {
    var data = appData();
    List commission = [];
    try {
      commission = [...(data["managerComm"] ?? [])];
      commission = commission
          .where((element) =>
              (element["id"] ?? "").toString().isNotEmpty &&
              (element["fromDate"] ?? "").toString().isNotEmpty)
          .toList();
    } catch (e) {}

    commission = commission
        .where(
          (element) => DateTime.now().isAfter(
            DateTime.parse(
              element["fromDate"],
            ),
          ),
        )
        .toList();

    if (commission.isEmpty) {
      return null;
    }

    Map comm = commission.reduce(
      (value, element) {
        if (DateTime.parse(
          value["fromDate"],
        ).isAfter(
          DateTime.parse(
            element["fromDate"],
          ),
        )) {
          return value;
        } else {
          return element;
        }
      },
    );
    return comm;
  }

  static Permissions getPermissions() {
    var boxData = Hive.box("data");
    var appData = Map<String, dynamic>.from(boxData.get("appData") ?? {});
    var agent = Map<String, dynamic>.from(appData["agent"] ?? {});
    var agency = Map<String, dynamic>.from(appData["agency"] ?? {});

    return Permissions.fromJson(Map<String, dynamic>.from({
      "typeAgent": agent["type"] ?? "1",
      ...Map.from(agency["permission"] ?? {}),
      ...Map.from(agent["permission"] ?? {}),
    }));
  }

  static Map appData() {
    Map data;
    var boxData = Hive.box("data");
    var appData = Map<String, dynamic>.from(boxData.get("appData") ?? {});
    var agent = Map<String, dynamic>.from(appData["agent"] ?? {});
    var agency = Map<String, dynamic>.from(appData["agency"] ?? {});
    var currency = Map<String, dynamic>.from(agency["currency"] ?? {});
    bool isManager =
        (agent["type"] != null) ? agent["type"].toString() == "2" : false;

    Permissions permissions = getPermissions();

    data = {
      "key": "qw56ew4hbn4k8j91d331xd3b1nj89re98w",
      "application": (appData["application"] != null)
          ? appData["application"]
          : "89e3bdfe55fb11ed942d0a9e2c1feaa0",
      "commission": agency["commission"] ?? {},
      "companies": agency["company"] ?? [],
      "company": (agency["company"] ?? [{}]).isEmpty
          ? {}
          : (agency["company"] ?? [{}]).first,
      "markup": agency["markup"] ?? {},
      "agency": {
        "id": agency["id"],
        "name": agency["nickname"],
      },
      "profile": agency["profile"] ?? {},
      "category": agency["category"] ?? {},
      "categoryId": (agency["category"] ?? {})["id"] ?? "",
      "categoryName": (agency["category"] ?? {})["name"] ?? "",
      "agencyId": (agent["agency"] != null) ? agent["agency"] : "",
      "executive": (agency["executive"] ?? {}),
      "executiveId": (agency["executive"] ?? {})["id"] ?? "",
      "attendant": (agency["atendant"] ?? {}),
      "attendantId": (agency["atendant"] ?? {})["id"] ?? "",
      "currencyCode": (currency["code"] != null) ? currency["code"] : "",
      "code": "85415",
      "agent": {
        "id": agent["id"],
        "name": "${agent["firstName"] ?? ""} ${agent["lastName"] ?? ""}",
        "phone": agent["phone"],
        "email": agent["email"],
        "created": "",
      },
      "seller": {
        "id": agent["id"],
        "name": "${agent["firstName"] ?? ""} ${agent["lastName"] ?? ""}",
        "phone": agent["phone"],
        "email": agent["email"],
        "created": "",
      },
      "sellerId": agent["id"],
      "agentId": agent["id"],
      "agentIdLong": agent["agentId"],
      "agentName":
          "${agent["firstName"] ?? ""} ${agent["lastName"] ?? ""}".trim(),
      "agentPhone": agent["phone"],
      "agentEmail": agent["email"],
      "agentCreated": "",
      "isManager": isManager,
      "hasDashboard": (agent["dashboard"] ?? "").toString().isNotEmpty &&
          permissions.dashboard,
      "dashboard": (agent["dashboard"] != null) ? agent["dashboard"] : "",
    };

    return data;
  }
}
