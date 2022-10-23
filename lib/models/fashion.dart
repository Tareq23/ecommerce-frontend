

class Fashion
{
  String? title;
  String? sortDesc;
  String? imageUrl;

  Fashion({this.title,this.imageUrl,this.sortDesc});
}

List<Fashion> fashionList = [
  Fashion(title: "Men's Fashion",sortDesc: 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown',imageUrl: 'https://cdn.pixabay.com/photo/2022/10/15/06/45/danube-river-7522608_960_720.jpg'),
  Fashion(title: "Women's Fashion",sortDesc: 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown',imageUrl: 'https://media.istockphoto.com/photos/river-blythe-warwickshire-uk-picture-id876453476?k=20&m=876453476&s=612x612&w=0&h=V6wjCwDt8_vyyF8W25hXglIuMPxU9hiou-tDG62RPO4='),
  Fashion(title: "Kid's Fashion",sortDesc: 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown',imageUrl: 'https://media.istockphoto.com/photos/view-of-everglades-swamp-in-florida-usa-picture-id1224962222?k=20&m=1224962222&s=612x612&w=0&h=rJLELoyEFDwnmOecrMdGHEBjf-ey_zvvN60HLU9EaXY='),
];