import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<String> imdbAPI(String id) async {
  String url = 'https://www.imdb.com/title/$id';
  http.Response response = await http.get(url);
  var document = parse(response.body);
  var ratings = document.getElementsByClassName('ratingValue')[0].text.trim();
  var title = document
      .getElementsByClassName('title_wrapper')[0]
      .children[0]
      .text
      .trim();
  var plot = document
      .getElementsByClassName('plot_summary')[0]
      .children[0]
      .text
      .trim();
  String stars() {
    var data = document
        .getElementsByClassName('plot_summary')[0]
        .children[3]
        .text
        .trim();
    var stars = data.substring(7, data.length - 24).trim();
    return stars;
  }

  String poster() {
    var a = document
        .getElementsByClassName('poster')[0]
        .getElementsByTagName('img')[0]
        .attributes['src']
        .trim()
        .replaceAll(new RegExp(r'._V1_UX182_CR0,0,182,268_AL_.jpg'),
            '._V1_SY1000_CR0,0,675,1000_AL_.jpg');
    ;
    return a;
  }

  print(title);
  print(ratings);
  print(plot);
  print(stars());
  print(poster());
}
