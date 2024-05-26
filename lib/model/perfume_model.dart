final listOfPerfume = [
  PerfumeModel(name: 'Chanel No. 5', ingredients: 'ose, jasmine, ylang-ylang', price: '\$80',perfumeImage: 'images/perfume_1.png'),
  PerfumeModel(name: 'Dolce', ingredients: 'bluebell, jasmine, bamboo', price: '\$60',perfumeImage: 'images/perfume_2.png'),
  PerfumeModel(name: 'Creed Aventus', ingredients: 'birch, musk, oakmoss', price: '\$300',perfumeImage: 'images/perfume_3.png'),
  PerfumeModel(name: 'YSL Black Opium', ingredients: 'Coffee, pepper, jasmine', price: '\$70',perfumeImage: 'images/perfume_4.png'),
  PerfumeModel(name: 'Tom Ford', ingredients: 'Truffle, bergamot, blackcurrant', price: '\$100',perfumeImage: 'images/perfume_5.png')
];



class PerfumeModel {
  String name;
  String ingredients;
  String price;
  String perfumeImage;
  PerfumeModel({required this.name,required this.ingredients,required this.price,required this.perfumeImage});
}