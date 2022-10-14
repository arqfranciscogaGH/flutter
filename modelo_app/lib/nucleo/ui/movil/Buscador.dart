//  librerias internas de flutter

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto
import '../../nucleo.dart';

class CustomSearchHintDelegate extends SearchDelegate<String> {
  Function? acccionConstruir;
  CustomSearchHintDelegate({
    required String hintText,
  }) : super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    Widget? w= Row();
    return const Text('leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildLeading
    Widget? w= Row();
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return acccionConstruir!(query);
  }
}
class Buscador extends SearchDelegate<EntidadBase> {
  Function? acccionConstruir;
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    Widget? w= Row();
    return const Text('leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildLeading
    Widget? w= Row();
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return acccionConstruir!(query);
  }
}
/* 
class CustomLocalizationDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture<MaterialLocalizations>(const CustomLocalization());

  @override
  bool shouldReload(CustomLocalizationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(en_US)';
}
class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "Capture";
}

 */
