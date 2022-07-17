class ClassesModel {
  bool isMine;
  String image;
  String name;
  int sessions;
  String category;
  double price;
  int availableSpace;
  String updatedOn;
  String desc;
  bool isActive;

  ClassesModel({
    required this.isMine,
    required this.image,
    required this.name,
    required this.sessions,
    required this.category,
    required this.price,
    required this.availableSpace,
    required this.updatedOn,
    required this.desc,
    this.isActive = true,
  });
}

class PackagesModel {
  bool isMine;
  String image;
  String name;
  double initialPrice;
  double bonusPrice;
  int sessions;
  int kidSessions;
  int oldSessions;
  String category;
  int availableSpace;
  String updatedOn;
  String desc;
  bool isActive;

  PackagesModel({
    required this.isMine,
    required this.image,
    required this.name,
    required this.initialPrice,
    required this.bonusPrice,
    required this.sessions,
    required this.kidSessions,
    required this.oldSessions,
    required this.category,
    required this.availableSpace,
    required this.updatedOn,
    required this.desc,
    this.isActive = true,
  });
}
