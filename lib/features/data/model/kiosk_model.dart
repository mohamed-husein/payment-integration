class KioskModel {
  int id;

  KioskModelData data;




  KioskModel({
    required this.id,

    required this.data,


  });

  factory KioskModel.fromJson(Map<String, dynamic> json) => KioskModel(
        id: json["id"],
       
  
        data: KioskModelData.fromJson(json["data"]),
      
    
      );

  Map<String, dynamic> toJson() => {
        "id": id,
     
        "data": data.toJson(),
       
      };
}

class KioskModelData {
  String klass;
  int gatewayIntegrationPk;
  dynamic ref;
  dynamic rrn;
  dynamic amount;
  dynamic fromUser;
  String message;
  dynamic biller;
  String txnResponseCode;
  int billReference;
  dynamic aggTerminal;
  int dueAmount;
  dynamic cashoutAmount;
  String paidThrough;
  String otp;

  KioskModelData({
    required this.klass,
    required this.gatewayIntegrationPk,
    this.ref,
    this.rrn,
    this.amount,
    this.fromUser,
    required this.message,
    this.biller,
    required this.txnResponseCode,
    required this.billReference,
    this.aggTerminal,
    required this.dueAmount,
    this.cashoutAmount,
    required this.paidThrough,
    required this.otp,
  });

  factory KioskModelData.fromJson(Map<String, dynamic> json) => KioskModelData(
        klass: json["klass"],
        gatewayIntegrationPk: json["gateway_integration_pk"],
        ref: json["ref"],
        rrn: json["rrn"],
        amount: json["amount"],
        fromUser: json["from_user"],
        message: json["message"],
        biller: json["biller"],
        txnResponseCode: json["txn_response_code"],
        billReference: json["bill_reference"],
        aggTerminal: json["agg_terminal"],
        dueAmount: json["due_amount"],
        cashoutAmount: json["cashout_amount"],
        paidThrough: json["paid_through"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "klass": klass,
        "gateway_integration_pk": gatewayIntegrationPk,
        "ref": ref,
        "rrn": rrn,
        "amount": amount,
        "from_user": fromUser,
        "message": message,
        "biller": biller,
        "txn_response_code": txnResponseCode,
        "bill_reference": billReference,
        "agg_terminal": aggTerminal,
        "due_amount": dueAmount,
        "cashout_amount": cashoutAmount,
        "paid_through": paidThrough,
        "otp": otp,
      };
}

class Order {
  int id;
  DateTime createdAt;
  bool deliveryNeeded;
  Merchant merchant;
  dynamic collector;
  int amountCents;
  IngData shippingData;
  String currency;
  bool isPaymentLocked;
  bool isReturn;
  bool isCancel;
  bool isReturned;
  bool isCanceled;
  dynamic merchantOrderId;
  dynamic walletNotification;
  int paidAmountCents;
  bool notifyUserWithEmail;
  List<Item> items;
  String orderUrl;
  int commissionFees;
  int deliveryFeesCents;
  int deliveryVatCents;
  String paymentMethod;
  dynamic merchantStaffTag;
  String apiSource;
  ExtraClass data;

  Order({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    this.collector,
    required this.amountCents,
    required this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    this.merchantStaffTag,
    required this.apiSource,
    required this.data,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        deliveryNeeded: json["delivery_needed"],
        merchant: Merchant.fromJson(json["merchant"]),
        collector: json["collector"],
        amountCents: json["amount_cents"],
        shippingData: IngData.fromJson(json["shipping_data"]),
        currency: json["currency"],
        isPaymentLocked: json["is_payment_locked"],
        isReturn: json["is_return"],
        isCancel: json["is_cancel"],
        isReturned: json["is_returned"],
        isCanceled: json["is_canceled"],
        merchantOrderId: json["merchant_order_id"],
        walletNotification: json["wallet_notification"],
        paidAmountCents: json["paid_amount_cents"],
        notifyUserWithEmail: json["notify_user_with_email"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        orderUrl: json["order_url"],
        commissionFees: json["commission_fees"],
        deliveryFeesCents: json["delivery_fees_cents"],
        deliveryVatCents: json["delivery_vat_cents"],
        paymentMethod: json["payment_method"],
        merchantStaffTag: json["merchant_staff_tag"],
        apiSource: json["api_source"],
        data: ExtraClass.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "delivery_needed": deliveryNeeded,
        "merchant": merchant.toJson(),
        "collector": collector,
        "amount_cents": amountCents,
        "shipping_data": shippingData.toJson(),
        "currency": currency,
        "is_payment_locked": isPaymentLocked,
        "is_return": isReturn,
        "is_cancel": isCancel,
        "is_returned": isReturned,
        "is_canceled": isCanceled,
        "merchant_order_id": merchantOrderId,
        "wallet_notification": walletNotification,
        "paid_amount_cents": paidAmountCents,
        "notify_user_with_email": notifyUserWithEmail,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "order_url": orderUrl,
        "commission_fees": commissionFees,
        "delivery_fees_cents": deliveryFeesCents,
        "delivery_vat_cents": deliveryVatCents,
        "payment_method": paymentMethod,
        "merchant_staff_tag": merchantStaffTag,
        "api_source": apiSource,
        "data": data.toJson(),
      };
}

class ExtraClass {
  ExtraClass();

  factory ExtraClass.fromJson(Map<String, dynamic> json) => ExtraClass();

  Map<String, dynamic> toJson() => {};
}

class Item {
  String name;
  String description;
  int amountCents;
  int quantity;

  Item({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        description: json["description"],
        amountCents: json["amount_cents"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "amount_cents": amountCents,
        "quantity": quantity,
      };
}

class Merchant {
  int id;
  DateTime createdAt;
  List<String> phones;
  List<String> companyEmails;
  String companyName;
  String state;
  String country;
  String city;
  String postalCode;
  String street;

  Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        phones: List<String>.from(json["phones"].map((x) => x)),
        companyEmails: List<String>.from(json["company_emails"].map((x) => x)),
        companyName: json["company_name"],
        state: json["state"],
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "phones": List<dynamic>.from(phones.map((x) => x)),
        "company_emails": List<dynamic>.from(companyEmails.map((x) => x)),
        "company_name": companyName,
        "state": state,
        "country": country,
        "city": city,
        "postal_code": postalCode,
        "street": street,
      };
}

class IngData {
  int? id;
  String firstName;
  String lastName;
  String street;
  String building;
  String floor;
  String apartment;
  String city;
  String state;
  String country;
  String email;
  String phoneNumber;
  String postalCode;
  String extraDescription;
  String? shippingMethod;
  int? orderId;
  int? order;

  IngData({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.postalCode,
    required this.extraDescription,
    this.shippingMethod,
    this.orderId,
    this.order,
  });

  factory IngData.fromJson(Map<String, dynamic> json) => IngData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        street: json["street"],
        building: json["building"],
        floor: json["floor"],
        apartment: json["apartment"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        extraDescription: json["extra_description"],
        shippingMethod: json["shipping_method"],
        orderId: json["order_id"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "street": street,
        "building": building,
        "floor": floor,
        "apartment": apartment,
        "city": city,
        "state": state,
        "country": country,
        "email": email,
        "phone_number": phoneNumber,
        "postal_code": postalCode,
        "extra_description": extraDescription,
        "shipping_method": shippingMethod,
        "order_id": orderId,
        "order": order,
      };
}

class PaymentKeyClaims {
  int userId;
  int amountCents;
  String currency;
  int integrationId;
  int orderId;
  IngData billingData;
  bool lockOrderWhenPaid;
  ExtraClass extra;
  bool singlePaymentAttempt;
  int exp;
  String pmkIp;

  PaymentKeyClaims({
    required this.userId,
    required this.amountCents,
    required this.currency,
    required this.integrationId,
    required this.orderId,
    required this.billingData,
    required this.lockOrderWhenPaid,
    required this.extra,
    required this.singlePaymentAttempt,
    required this.exp,
    required this.pmkIp,
  });

  factory PaymentKeyClaims.fromJson(Map<String, dynamic> json) =>
      PaymentKeyClaims(
        userId: json["user_id"],
        amountCents: json["amount_cents"],
        currency: json["currency"],
        integrationId: json["integration_id"],
        orderId: json["order_id"],
        billingData: IngData.fromJson(json["billing_data"]),
        lockOrderWhenPaid: json["lock_order_when_paid"],
        extra: ExtraClass.fromJson(json["extra"]),
        singlePaymentAttempt: json["single_payment_attempt"],
        exp: json["exp"],
        pmkIp: json["pmk_ip"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "amount_cents": amountCents,
        "currency": currency,
        "integration_id": integrationId,
        "order_id": orderId,
        "billing_data": billingData.toJson(),
        "lock_order_when_paid": lockOrderWhenPaid,
        "extra": extra.toJson(),
        "single_payment_attempt": singlePaymentAttempt,
        "exp": exp,
        "pmk_ip": pmkIp,
      };
}

class SourceData {
  String type;
  String subType;
  String pan;

  SourceData({
    required this.type,
    required this.subType,
    required this.pan,
  });

  factory SourceData.fromJson(Map<String, dynamic> json) => SourceData(
        type: json["type"],
        subType: json["sub_type"],
        pan: json["pan"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "sub_type": subType,
        "pan": pan,
      };
}
