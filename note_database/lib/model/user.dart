import 'package:note_database/contant/fild.dart';

class User {
  String? utitle;
  String? uper;
  String? unote;
  String? utime;
  String? ucolor;

  User({this.utitle, this.uper, this.unote, this.utime, this.ucolor});

  Map<String, dynamic> toJson() {
    return {
      futitle: utitle,
      fuper: uper,
      funote: unote,
      futime: utime,
      fucolor: ucolor
    };
  }

  User.fromJson(Map<String, dynamic> res) {
    utitle = res[futitle];
    uper = res[fuper];
    unote = res[funote];
    utime = res[futime];
    ucolor = res[fucolor];
  }
}
