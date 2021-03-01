import 'dart:io';
import 'package:Brisacliente/src/models/client.dart';
import 'package:Brisacliente/src/models/contract.dart';
import 'package:Brisacliente/src/repositories/GuestRepository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'GuestPageController.g.dart';

class GuestPageController = _GuestPageControllerBase with _$GuestPageController;

abstract class _GuestPageControllerBase with Store {
  var client = Client();
  var _guestRepository = GuestRepository();
  final _picker = ImagePicker();

  @observable
  String error = "";

  @action 
  setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  ObservableMap<String, File> _images = ObservableMap<String, File>.of({});

  @action
  setImage(String type, File image){
    _images[type] = image;
  }

  bool haveImage(String type){
    if (_images.containsKey(type)){
      return true;
    }
    return false;
  }

  @observable
  List<Contract> contracts =  [];

  @action
  setContracts(List<Contract> value) => contracts = value;

  Future<bool> isContractNotAccepted() async{
    try {
      setLoading(true);
      bool isAccepted = await _guestRepository.isContractsNotAccepted(client.cpf);
      setLoading(false);
      if (isAccepted){
        
        setError("");
        return true;
      }

      setError("Não foi encontrado nenhum orçamento para este documento");
    } catch(err) {
      
      setError("Ocorreu um Erro");
    }
    setLoading(false);

    return false;
  }

  Future getImage(String type) async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setImage(type, File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  Future getContracts() async {
    setContracts(
      await _guestRepository.getContracts()
    );
  }

  Future<Map<String,Map<String,String>>> finish() async {
    if (await _guestRepository.sendDocuments(this._images, this.client.cpf)){     
      return {
        "Successfully" : { 
          "title" : "Documentos enviados com sucesso",
          "text" : "Por favor aguarde até que um atendente verifique seus documentos e entre em contato"
        }
      };
    }

    return {
      "Error": {
        "text" : "Por favor tente novamente"
      }
    };
  }
}