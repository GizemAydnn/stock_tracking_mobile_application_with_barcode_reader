class DummyData {
  List<Warehouse> items = [
    Warehouse(
      id: 1,
      name: 'İçmesuyu Ambarı',
    ),
    Warehouse(
      id: 2,
      name: 'Kanalizasyon Ambarı',
    ),
    Warehouse(
      id: 3,
      name: 'Abone Hizmetleri Ambarı',
    ),
    Warehouse(
      id: 4,
      name: 'Bilgi İşlem Ambarı',
    ),
  ];
}

class Warehouse {
  final int id;
  final String name;

  Warehouse({required this.id, required this.name});
}
