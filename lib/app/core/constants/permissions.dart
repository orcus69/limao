// ignore_for_file: unrelated_type_equality_checks

class Permissions {
  Permissions._privateConstructor();

  static final Permissions _instance = Permissions._privateConstructor();

  factory Permissions() {
    return _instance;
  }

  late bool isVisibleAgent;
  late String includePayment;
  late String paymentCondition;
  late bool intermediaries;
  late bool events;
  late bool promotions;
  late bool partialPayment;
  late bool openBalance;
  late bool serviceDiscount;
  late bool salesSellers;
  late bool saleEdition;
  late bool editSalesSeller;
  late bool courtesy;
  late bool addition;
  late bool paymentLink;
  late bool multipleZones;
  late bool deleteBudget;
  late bool customizableChat;
  late bool dashboard;
  late bool structureAndData;
  late bool requestRefund;
  late bool addPassenger;
  late bool payPerService;
  late bool changeImage;
  late String segment;
  late String removeServices;
  late bool requiredBuyer;
  late bool flight;
  late bool otherServices;
  late bool paxValidation;
  late bool saleCredit;

  Permissions.fromJson(Map<String, dynamic> json) {
    isVisibleAgent = !((json['typeAgent'] ?? "").toString() == "1");
    includePayment = json['includePayment'] ?? "";
    paymentCondition = json['paymentCondition'] ?? "";
    segment = json['segment'] ?? "";
    intermediaries =
        (json['intermediaries'] ?? "").toString() == "1" ? true : false;
    events = (json['events'] ?? "").toString() == "1" ? true : false;
    removeServices = (json['removeServices'] ?? "").toString();
    flight = !removeServices.split(",").contains("61");
    otherServices = !removeServices.split(",").contains("60");
    promotions = (json['promotions'] ?? "").toString() == "1" ? true : false;
    paxValidation =
        (json['paxValidation'] ?? "").toString() == "1" ? true : false;
    // payment = (json['payment'] ?? "").toString() == "1" ? true : false;
    saleCredit = (json['saleCredit'] ?? "").toString() == "1" ? true : false;
    partialPayment =
        (json['partialPayment'] ?? "").toString() == "1" ? true : false;
    openBalance = (json['openBalance'] ?? "").toString() == "1" ? true : false;
    serviceDiscount =
        (json['serviceDiscount'] ?? "").toString() == "1" ? true : false;
    salesSellers =
        (json['salesSellers'] ?? "").toString() == "1" ? true : false;
    saleEdition = (json['saleEdition'] ?? "").toString() == "1" ? true : false;
    editSalesSeller =
        (json['editSalesSeller'] ?? "").toString() == "1" ? true : false;
    courtesy = (json['courtesy'] ?? "").toString() == "1" ? true : false;
    addition = (json['addition'] ?? "").toString() == "1" ? true : false;
    //alter
    paymentLink = (json['paymentLink'] ?? "").toString() == "1" ? true : true;
    multipleZones =
        (json['multipleZones'] ?? "").toString() == "1" ? true : false;
    requiredBuyer =
        (json['requiredBuyer'] ?? "").toString() == "1" ? true : false;
    deleteBudget =
        (json['deleteBudget'] ?? "").toString() == "1" ? true : false;
    customizableChat =
        (json['customizableChat'] ?? "").toString() == "1" ? true : false;
    dashboard = (json['dashboard'] ?? "").toString() == "1" ? true : false;
    structureAndData =
        (json['structureAndData'] ?? "").toString() == "1" ? true : false;
    requestRefund =
        (json['requestRefund'] ?? "").toString() == "1" ? true : false;
    addPassenger =
        (json['addPassenger'] ?? "").toString() == "1" ? true : false;
    payPerService =
        (json['payPerService'] ?? "").toString() == "1" ? true : false;
    changeImage = (json['changeImage'] ?? "").toString() == "1" ? true : false;
  }
}
