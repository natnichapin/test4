import 'package:flutter/material.dart';
import 'package:http/http.dart'as http; //ตั้งชื่อเล่นโดย as เพื่อเอาไปใช้
import 'ExchangeRate.dart';
void main() {
  runApp(Myapp());
}

//สร้างwidget : สามารถออกแบบทีหลัง โดยให้ main รอรับ widget มาทำงาน
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ส่งค่ากลับมาในรูปแบบ widget
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    ); //ได้หน้าตาที่เขียน เขียนผ่าน return build โดยเรียกใช้งานผ่านชื่อ widget
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ExchangeRate? _dataFromAPI ;
  @override
  void initState() {
    getExchangeRate();
    super.initState();
  }
  Future<void> getExchangeRate() async{
    var url = Uri.parse("https://api.exchangerate-api.com/v4/latest/USD");
    var response= await http.get(url);
    _dataFromAPI = ExchangeRate.fromJson(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //มี 2 ส่วน
      //สำเร็จรูปมาช่วยจัด
        appBar: AppBar(
          title: Text("อัตราการแลกเปลี่ยนของสกุลเงิน"),
        ),
        body: Column(children: [],));
  }
}