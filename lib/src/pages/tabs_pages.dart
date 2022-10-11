import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
       ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel >(context);




    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual =i,
      items:[
        BottomNavigationBarItem( icon: Icon( Icons.person_outline ), label: 'Para ti' ),
        BottomNavigationBarItem( icon: Icon( Icons.public ), label: 'Encabezados' ),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        Container(
          color: Colors.amber,
        ),

        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual( int valor ){
    this._paginaActual = valor;
    notifyListeners();
  }
}