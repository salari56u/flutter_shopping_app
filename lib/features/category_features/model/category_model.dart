class CategoryModel
{
  int? status;
  List<Catgory>? category;

  CategoryModel({this.status, this.category});
  CategoryModel.fromJson(dynamic json)
  {
    status=json['status'];
    if(json['category']!=null)
      {
        category=[];
        json['category'].forEach((value)
        {
          category?.add(Catgory.fromJson(value));
        });
      }
  }
}
class Catgory
{
  int? id;
  String? title;
  List<SubCategory>? subcategory;

  Catgory({this.id, this.title, this.subcategory});
  Catgory.fromJson(dynamic json)
  {
    id=json['id'];
    title=json['title'];
    if(json['sub_category'] !=null)
      {
        subcategory=[];
        json['sub_category'].forEach((value)
        {
          subcategory?.add(SubCategory.fromJson(value));
        });
      }
  }
}

class SubCategory
{
  int? id;
  String? title;
  String? parentId;
  String? image;

  SubCategory({ this.id, this.title, this.parentId, this.image});

  SubCategory.fromJson(dynamic json)
  {
    id=json['id'];
    title=json['title'];
    parentId=json['parent_id'];
    image=json['image'];
  }
}