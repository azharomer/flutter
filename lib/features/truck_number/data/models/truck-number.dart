class TruckNumberModel {
  final String TruckNumber;
  final String SapTruckNumber;
  // final String Type;
  // final String Category;
  final String FirebaseToken;
  // final bool Tracked;
  // final String Lat;
  // final String Long;
  // final String Owner;
  // final String Status;
  // final String TripType;

  TruckNumberModel(
      {this.TruckNumber,
      this.SapTruckNumber,
      // this.Type,
      // this.Category,
      this.FirebaseToken,
      // this.Tracked,
      // this.Lat,
      // this.Long,
      // this.Owner,
      // this.Status,
      // this.TripType
      });

  factory TruckNumberModel.fromJson(Map<String, dynamic> json) {
    return TruckNumberModel(
      TruckNumber: json['TruckNumber'],
      SapTruckNumber: json['SapTruckNumber'],
      // Type: json['Type'],
      // Category: json['Category'],
      FirebaseToken: json['FirebaseToken'],
      // Tracked: json['Tracked'] as bool,
      // Lat: json['Lat'],
      // Long: json['Long'],
      // Owner: json['Owner'],
      // Status: json['Status'],
      // TripType: json['TripType'],
    );
  }
  Map<String, dynamic> toJson() => {
        "TruckNumber": TruckNumber,
        "SapTruckNumber": SapTruckNumber,
        "Type": Type,
        // "Category": Category,
        "FirebaseToken": FirebaseToken,
        // "Tracked": Tracked,
        // "Lat": Lat,
        // "Long": Long,
        // "Owner": Owner,
        // "Status": Status,
        // "TripType": TripType,
      };
}
