class HomeModel
{
  TopBanner? topBanner;
  List<Sliders>? sliders;
  List<Brands>? brands=[];
  List<Amazing>? amazing;
  List<Random>? random;
  List<CategoryBanner>? categorybanner;
  List<ColOne>? colone;
  List<ColTwo>? coltwo;
  List<ColTree>? colthree;
  List<ColFour>? colfour;
  List<ColFive>? colfive;
  List<TwoBanners>? twobanners;

  String? colOneName;
  String? colOneId;

  String? colTwoName;
  String? colTwoId;

  String? colThreeName;
  String? colThreeId;

  String? colFourName;
  String? colFourId;

  String? colFiveName;
  String? colFiveId;

  HomeModel.fromJson(dynamic json)
  {
   topBanner =TopBanner.fromJson(json['top_banner']);
   if(json['sliders']!=null)
     {
       sliders=[];
       json['sliders'].forEach((value)
       {
         sliders?.add(Sliders.fromJson(value));
       });
     }
   if(json['brands'] !=null)
     {
       json['brands'].forEach((value)
       {
         brands?.add(Brands.fromJson(value));
       });
     }
   if (json['amazings'] != null) {
     amazing = [];
     json['amazings'].forEach((value) {
       amazing?.add(Amazing.fromJson(value));
     });
   }
   if (json['random'] != null) {
     random = [];
     json['random'].forEach((value) {
       random?.add(Random.fromJson(value));
     });
   }
   if (json['category_banner'] != null) {
     categorybanner = [];
     json['category_banner'].forEach((value) {
       categorybanner?.add(CategoryBanner.fromJson(value));
     });
   }
   if (json['col_one'] != null) {
     colone = [];
     json['col_one'].forEach((value) {
       colone?.add(ColOne.fromJson(value));
     });
   }if (json['col_two'] != null) {
     coltwo = [];
     json['col_two'].forEach((value) {
       coltwo?.add(ColTwo.fromJson(value));
     });
   }if (json['col_three'] != null) {
     colthree = [];
     json['col_three'].forEach((value) {
       colthree?.add(ColTree.fromJson(value));
     });
   }if (json['col_four'] != null) {
     colfour = [];
     json['col_four'].forEach((value) {
       colfour?.add(ColFour.fromJson(value));
     });
   }if (json['col_five'] != null) {
     colfive = [];
     json['col_five'].forEach((value) {
       colfive?.add(ColFive.fromJson(value));
     });
   }
   if (json['banner_two_column'] != null) {
     twobanners = [];
     json['banner_two_column'].forEach((value) {
       twobanners?.add(TwoBanners.fromJson(value));
     });
   }
   colOneId = json['col_one_id'].toString() ?? '0';
   colTwoId = json['col_two_id'].toString() ?? '0';
   colThreeId = json['col_three_id'].toString() ?? '0';
   colFourId = json['col_four_id'].toString() ?? '0';
   colFiveId = json['col_five_id'].toString() ?? '0';
   colOneName = json['col_one_name'];
   colTwoName = json['col_two_name'];
   colThreeName = json['col_three_name'];
   colFourName = json['col_four_name'];
   colFiveName = json['col_five_name'];
  }
}

class TwoBanners extends CategoryBanner
{
  TwoBanners.fromJson(super.json) : super.fromJson();
}
class CategoryBanner
{

  String? link;
  String? image;

  CategoryBanner({required this.link,required this.image});
  CategoryBanner.fromJson(dynamic json)
  {
    link=json['link'];
    image=json['image'];
  }
}

class ColOne extends Random {
  ColOne.fromJson(super.json) : super.fromJson();
}
class ColTwo extends Random {
  ColTwo.fromJson(super.json) : super.fromJson();
}
class ColTree extends Random {
  ColTree.fromJson(super.json) : super.fromJson();
}
class ColFour extends Random {
  ColFour.fromJson(super.json) : super.fromJson();
}
class ColFive extends Random {
  ColFive.fromJson(super.json) : super.fromJson();
}
class Random
{
  String? id;
  String? titile;
  String? default_price;
  String? image;

  Random({required this.id,required this.titile,required this.default_price,required this.image});
  Random.fromJson(dynamic json)
  {
    id= json['id'].toString();
    titile=json['title'];
    default_price=json['default_price'].toString();
    image=json['image'];
  }
}
class Amazing {
  String? id;
  String? title;
  String? image;
  String? defaultPrice;
  String? percent;
  int? percentPrice;

  Amazing({
    required this.id,
    required this.title,
    required this.image,
    required this.defaultPrice,
    required this.percent,
    required this.percentPrice,
  });
  Amazing.fromJson(dynamic json) {
    id = json['id'].toString();
    title = json['title'];
    image = json['image'];
    defaultPrice = json['default_price'];
    percent = json['percent'].toString();
    percentPrice = json['percent_price'];
  }
}



class Brands
{

  String? link;
  String? image;

  Brands({required this.link,required this.image});
  Brands.fromJson(dynamic json)
  {
    link=json['link'];
    image=json['image'];
  }
}
class Sliders
{
  String? image;
  String? link;
  int? id;

  Sliders({required this.image,required this.link,required this.id});

  Sliders.fromJson(dynamic json)
  {
    image=json['image'];
    link=json['link'];
    id=json['id'];
  }
}


class TopBanner
{
  String? link;
  String? image;
  String? type;

  TopBanner({required this.link,required this.image,required this.type});

  TopBanner.fromJson(dynamic jason)
  {
    link=jason['link'];
    image=jason['image'];
    type=jason['type'];
  }
}