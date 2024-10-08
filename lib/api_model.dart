class ApiList {

  List<Movie> movieList=[];

  ApiList.fromJson(List<dynamic> list){
    movieList = list.map((e){
      return Movie.fromJson(e);
    }).toList();
  }


}


class Movie {
  String? name="";

  Movie.fromJson(Map<String, dynamic> json){
    name= json["name"] ?? "";
  }
}