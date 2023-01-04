import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1',      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {

    Widget _pageTitle() {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(10,100,10,60),
        child: const Text(
          'Log In',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
      );
    }

    Widget _usernameField() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value){
            username = value;
          },
          decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(24.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(24.0)),
              borderSide: BorderSide(color: (isLoginSuccess) ? Colors.grey : Colors.red),
            ),
          ),
        ),
      );
    }

    Widget _passwordField() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value){
            password = value;
          },
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(24.0)),
              borderSide: BorderSide(color: (isLoginSuccess) ? Colors.grey : Colors.red),
            ),
          ),
        ),
      );
    }

    Widget _loginButton(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            String text = "";
            if (username == "1" && password == "2") {
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
              });
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            } else {
              setState(() {
                text = "Login Failed";
                isLoginSuccess = false;
              });
            }
            SnackBar snackBar = SnackBar(
              content: Text(text),
              backgroundColor: (isLoginSuccess)? Colors.green : Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Login'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(
          children: [
            _pageTitle(),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ]
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key:
  key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Widget _judul() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10,20,10,10),
        child: const Text(
          'Daftar Anggota',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      );
    }

    Widget _listAnggota() {
      return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _judul(),
          ListTile(title: Text('Wahyu Candra'), subtitle: Text('124200058')),
          ListTile(title: Text('Bita Cantik'), subtitle: Text('124200036')),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: _listAnggota(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Calculator();
          }));
        },
        tooltip: 'Penghitunganz',
        child: const Icon(Icons.apps),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var _input1 = '';
  var _input2 = '';
  int _hasil = 0;

  void _operasiTambah(var a, var b) {
    setState(() {
      try {
        setState(() {
          _hasil = int.parse(_input1) + int.parse(_input2);
        });
      } on FormatException {
        print('Input Salah!');
      }
    });
  }

  void _operasiKurang(var a, var b) {
    setState(() {
      try {
        setState(() {
          _hasil = int.parse(_input1) - int.parse(_input2);
        });
      } on FormatException {
        print('Input Salah!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget _numberField1() {
      return Container(
          padding: EdgeInsets.fromLTRB(20,60,20,10),
          child: TextFormField(
            enabled: true,
            onChanged: (value){
              _input1 = value;
            },
            decoration: InputDecoration(
              hintText: 'Angka Penjumlah Pertama',
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              border: UnderlineInputBorder(),
            ),
          ),
      );
    }

    Widget _numberField2() {
      return Container(
        padding: EdgeInsets.fromLTRB(20,10,20,10),
        child: TextFormField(
          enabled: true,
          onChanged: (value){
            _input2 = value;
          },
          decoration: InputDecoration(
            hintText: 'Angka Penjumlah Kedua',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: UnderlineInputBorder(),
          ),
        ),
      );
    }

    Widget _buttonRow() {
      return Container(
          padding: EdgeInsets.only(top: 20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _operasiTambah(_input1, _input2);
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.blue,
                  // onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _operasiKurang(_input1, _input2);
                },
                child: Icon(Icons.remove),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.red,
                ),
              )
            ],
          )
      );
    }

    Widget _hasilJumlah() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10,50,10,10),
        child: Column(
          children: [
            const Text(
              'Hasil :',
            ),
            Text(
              '$_hasil',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Penghitungan'),
      ),
      body: Column(
        children: [
          _numberField1(),
          _numberField2(),
          _buttonRow(),
          _hasilJumlah(),
        ],
      )
    );
  }
}

// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     String username = "";
//     String password = "";
//
//     Widget _pageTitle() {
//       return Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.fromLTRB(10,100,10,60),
//         child: const Text(
//           'Log In',
//           style: TextStyle(
//             color: Colors.blue,
//             fontWeight: FontWeight.w500,
//             fontSize: 30),
//         ),
//       );
//     }
//
//     Widget _usernameField() {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//         child: TextFormField(
//           enabled: true,
//           onChanged: (value){
//             username = value;
//           },
//           decoration: const InputDecoration(
//             hintText: 'Username',
//             contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             border: OutlineInputBorder(
//               borderRadius:
//               BorderRadius.all(Radius.circular(24.0)),
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//         ),
//       );
//     }
//
//     Widget _passwordField() {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//         child: TextFormField(
//           enabled: true,
//           onChanged: (value){
//             password = value;
//           },
//           obscureText: true,
//           decoration: const InputDecoration(
//             hintText: 'Password',
//             contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             border: OutlineInputBorder(
//               borderRadius:
//               BorderRadius.all(Radius.circular(24.0)),
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//         ),
//       );
//     }
//
//     Widget _loginButton(BuildContext context) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//         width: MediaQuery.of(context).size.width,
//         child: ElevatedButton(
//           onPressed: () {
//             String text = "";
//             if (username == "flutterMobile" && password ==
//                 "flutter123"){
//               text = "Login Success";
//             } else {
//               text = "Login Failed";
//             }
//             SnackBar snackBar = SnackBar(
//               content: Text(text),
//             );
//
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           },
//           child: const Text('Login'),
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.all(20),
//           ),
//         ),
//       );
//     }
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Login Page"),
//         ),
//         body: Column(
//             children: [
//               _pageTitle(),
//               _usernameField(),
//               _passwordField(),
//               _loginButton(context),
//             ]
//         ),
//       ),
//     );
//   }
// }
