
import 'usuario_model.dart';

class FileSignature{
  String file64;
  String logo64;
  String path;
  String password;
  Usuario usuario;
  void main(){
    //bool Keycloack;
    //Keycloack = false;
  }
  
  FileSignature({
    required this.file64,
    required this.logo64,
    required this.path,
    required this.password,
    required this.usuario,
  });
   factory FileSignature.fromJson(Map<String, dynamic> json) => FileSignature(
        file64: json["file64"],
        logo64: json["logo64"],
        path: json["path"],
        password: json["password"],
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
"file64": file64,
"logo64": logo64,
"path": path,
"password": password,
"usuario": usuario.toJson(),

    };

}
