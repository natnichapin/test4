import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//สร้าง container ต้นแบบเอาไว้ แทนที่จะสร้าง 4 ตัว เพื่อให้เรียกใช้งาน
class MoneyBox extends StatelessWidget {
  //build ตัว widget เพราะเป็น stateless  จะรีเทินค่า container เป็นค่าเริ่มต้น
//ดูว่าแต่ละ Container แตกต่างกันอย่างไร

 String title  ;//ชื่อหมวดหมู / รายการ
  double amount ; //จำนวนเงิน
  Color color ; //สีของกล่อง
  double size ; // ขนาดของกล่อง
MoneyBox(this.title,this.amount,this.color,this.size) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            //# แทนอะไรก็ได้ ### บอกว่าถ้าสามตัวขึ้นไปแสดง Comma และ ตามด้วยใส่จุด
            '${NumberFormat("#,###.##").format(amount)}'.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.right,
          ),
        ),
      ]),
    );
  }
}
