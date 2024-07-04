// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final List<Barb0Kimxxx>? barb0Kimxxx;

  Welcome({
    this.barb0Kimxxx,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    barb0Kimxxx: json["BARB0KIMXXX"] == null ? [] : List<Barb0Kimxxx>.from(json["BARB0KIMXXX"]!.map((x) => Barb0Kimxxx.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "BARB0KIMXXX": barb0Kimxxx == null ? [] : List<dynamic>.from(barb0Kimxxx!.map((x) => x.toJson())),
  };
}

class Barb0Kimxxx {
  final String? maskedAccount;
  final String? linkRefNum;
  final DecryptedData? decryptedData;

  Barb0Kimxxx({
    this.maskedAccount,
    this.linkRefNum,
    this.decryptedData,
  });

  factory Barb0Kimxxx.fromJson(Map<String, dynamic> json) => Barb0Kimxxx(
    maskedAccount: json["masked_account"],
    linkRefNum: json["link_ref_num"],
    decryptedData: json["decrypted_data"] == null ? null : DecryptedData.fromJson(json["decrypted_data"]),
  );

  Map<String, dynamic> toJson() => {
    "masked_account": maskedAccount,
    "link_ref_num": linkRefNum,
    "decrypted_data": decryptedData?.toJson(),
  };
}

class DecryptedData {
  final Account? account;

  DecryptedData({
    this.account,
  });

  factory DecryptedData.fromJson(Map<String, dynamic> json) => DecryptedData(
    account: json["Account"] == null ? null : Account.fromJson(json["Account"]),
  );

  Map<String, dynamic> toJson() => {
    "Account": account?.toJson(),
  };
}

class Account {
  final String? type;
  final String? maskedAccNumber;
  final String? version;
  final String? linkedAccRef;
  final String? xmlns;
  final String? xmlnsWstxns1;
  final String? wstxns1SchemaLocation;
  final Profile? profile;
  final Summary? summary;
  final Transactions? transactions;

  Account({
    this.type,
    this.maskedAccNumber,
    this.version,
    this.linkedAccRef,
    this.xmlns,
    this.xmlnsWstxns1,
    this.wstxns1SchemaLocation,
    this.profile,
    this.summary,
    this.transactions,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    type: json["type"],
    maskedAccNumber: json["maskedAccNumber"],
    version: json["version"],
    linkedAccRef: json["linkedAccRef"],
    xmlns: json["xmlns"],
    xmlnsWstxns1: json["xmlns:wstxns1"],
    wstxns1SchemaLocation: json["wstxns1:schemaLocation"],
    profile: json["Profile"] == null ? null : Profile.fromJson(json["Profile"]),
    summary: json["Summary"] == null ? null : Summary.fromJson(json["Summary"]),
    transactions: json["Transactions"] == null ? null : Transactions.fromJson(json["Transactions"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "maskedAccNumber": maskedAccNumber,
    "version": version,
    "linkedAccRef": linkedAccRef,
    "xmlns": xmlns,
    "xmlns:wstxns1": xmlnsWstxns1,
    "wstxns1:schemaLocation": wstxns1SchemaLocation,
    "Profile": profile?.toJson(),
    "Summary": summary?.toJson(),
    "Transactions": transactions?.toJson(),
  };
}

class Profile {
  final Holders? holders;

  Profile({
    this.holders,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    holders: json["Holders"] == null ? null : Holders.fromJson(json["Holders"]),
  );

  Map<String, dynamic> toJson() => {
    "Holders": holders?.toJson(),
  };
}

class Holders {
  final String? type;
  final Holder? holder;

  Holders({
    this.type,
    this.holder,
  });

  factory Holders.fromJson(Map<String, dynamic> json) => Holders(
    type: json["type"],
    holder: json["Holder"] == null ? null : Holder.fromJson(json["Holder"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "Holder": holder?.toJson(),
  };
}

class Holder {
  final String? name;
  final DateTime? dob;
  final String? mobile;
  final String? nominee;
  final String? landline;
  final String? address;
  final String? email;
  final String? pan;
  final String? ckycCompliance;

  Holder({
    this.name,
    this.dob,
    this.mobile,
    this.nominee,
    this.landline,
    this.address,
    this.email,
    this.pan,
    this.ckycCompliance,
  });

  factory Holder.fromJson(Map<String, dynamic> json) => Holder(
    name: json["name"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    mobile: json["mobile"],
    nominee: json["nominee"],
    landline: json["landline"],
    address: json["address"],
    email: json["email"],
    pan: json["pan"],
    ckycCompliance: json["ckycCompliance"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "mobile": mobile,
    "nominee": nominee,
    "landline": landline,
    "address": address,
    "email": email,
    "pan": pan,
    "ckycCompliance": ckycCompliance,
  };
}

class Summary {
  final String? currentBalance;
  final String? currency;
  final String? exchgeRate;
  final DateTime? balanceDateTime;
  final String? type;
  final String? branch;
  final String? facility;
  final String? ifscCode;
  final String? micrCode;
  final DateTime? openingDate;
  final String? currentOdLimit;
  final String? drawingLimit;
  final String? status;
  final Pending? pending;

  Summary({
    this.currentBalance,
    this.currency,
    this.exchgeRate,
    this.balanceDateTime,
    this.type,
    this.branch,
    this.facility,
    this.ifscCode,
    this.micrCode,
    this.openingDate,
    this.currentOdLimit,
    this.drawingLimit,
    this.status,
    this.pending,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    currentBalance: json["currentBalance"],
    currency: json["currency"],
    exchgeRate: json["exchgeRate"],
    balanceDateTime: json["balanceDateTime"] == null ? null : DateTime.parse(json["balanceDateTime"]),
    type: json["type"],
    branch: json["branch"],
    facility: json["facility"],
    ifscCode: json["ifscCode"],
    micrCode: json["micrCode"],
    openingDate: json["openingDate"] == null ? null : DateTime.parse(json["openingDate"]),
    currentOdLimit: json["currentODLimit"],
    drawingLimit: json["drawingLimit"],
    status: json["status"],
    pending: json["Pending"] == null ? null : Pending.fromJson(json["Pending"]),
  );

  Map<String, dynamic> toJson() => {
    "currentBalance": currentBalance,
    "currency": currency,
    "exchgeRate": exchgeRate,
    "balanceDateTime": balanceDateTime?.toIso8601String(),
    "type": type,
    "branch": branch,
    "facility": facility,
    "ifscCode": ifscCode,
    "micrCode": micrCode,
    "openingDate": "${openingDate!.year.toString().padLeft(4, '0')}-${openingDate!.month.toString().padLeft(2, '0')}-${openingDate!.day.toString().padLeft(2, '0')}",
    "currentODLimit": currentOdLimit,
    "drawingLimit": drawingLimit,
    "status": status,
    "Pending": pending?.toJson(),
  };
}

class Pending {
  final Type? transactionType;
  final String? amount;

  Pending({
    this.transactionType,
    this.amount,
  });

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
    transactionType: typeValues.map[json["transactionType"]]!,
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "transactionType": typeValues.reverse[transactionType],
    "amount": amount,
  };
}

enum Type {
  CREDIT,
  DEBIT
}

final typeValues = EnumValues({
  "CREDIT": Type.CREDIT,
  "DEBIT": Type.DEBIT
});

class Transactions {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Transaction>? transaction;

  Transactions({
    this.startDate,
    this.endDate,
    this.transaction,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    transaction: json["Transaction"] == null ? [] : List<Transaction>.from(json["Transaction"]!.map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "Transaction": transaction == null ? [] : List<dynamic>.from(transaction!.map((x) => x.toJson())),
  };
}

class Transaction {
  final Type? type;
  final Mode? mode;
  final String? amount;
  final String? currentBalance;
  final DateTime? transactionTimestamp;
  final DateTime? valueDate;
  final String? txnId;
  final String? narration;
  final String? reference;

  Transaction({
    this.type,
    this.mode,
    this.amount,
    this.currentBalance,
    this.transactionTimestamp,
    this.valueDate,
    this.txnId,
    this.narration,
    this.reference,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    type: typeValues.map[json["type"]]!,
    mode: modeValues.map[json["mode"]]!,
    amount: json["amount"],
    currentBalance: json["currentBalance"],
    transactionTimestamp: json["transactionTimestamp"] == null ? null : DateTime.parse(json["transactionTimestamp"]),
    valueDate: json["valueDate"] == null ? null : DateTime.parse(json["valueDate"]),
    txnId: json["txnId"],
    narration: json["narration"],
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "mode": modeValues.reverse[mode],
    "amount": amount,
    "currentBalance": currentBalance,
    "transactionTimestamp": transactionTimestamp?.toIso8601String(),
    "valueDate": "${valueDate!.year.toString().padLeft(4, '0')}-${valueDate!.month.toString().padLeft(2, '0')}-${valueDate!.day.toString().padLeft(2, '0')}",
    "txnId": txnId,
    "narration": narration,
    "reference": reference,
  };
}

enum Mode {
  ATM,
  OTHERS,
  UPI
}

final modeValues = EnumValues({
  "ATM": Mode.ATM,
  "OTHERS": Mode.OTHERS,
  "UPI": Mode.UPI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
