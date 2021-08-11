import 'package:covidapi/constants.dart';
import 'package:covidapi/model/covid_today.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = Uri.parse(
      'https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR2gF0-_YJxG8zX1geiAwBHS4JhVR-Vpx2GIvFY29vRtGfIqkCBfdz8zYfE');

  late CovidToday _dataSundayAPI;
  var f = NumberFormat('#,###');
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var response = await http.get(url);
    print(response.body);
    print('refresing..');

    setState(() {
      _dataSundayAPI = covidTodayFromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Covid 19',
            style: kTextHeadStyle,
          ),
        ),
        backgroundColor: Colors.red.shade400,
      ),
      backgroundColor: background,
      body: RefreshIndicator(
        onRefresh: getData,
        child: ListView(
          children: [
            buildtitle(),
            buildcasces(),
            buildrecovered(),
            buildtitleupdate(),
            buildtitlecovid(),
            buildlottie(),
          ],
        ),
      ),
    );
  }

  buildtitle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text('จำนวนผู้ติดเชื้อ Covid-19', style: kTextTitleHeadStyle),
            Text('ในประเทศไทย', style: kTextTitleHeadStyle),
          ],
        ),
      ),
    );
  }

  buildcasces() {
    return Container(
      height: 200,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: deeporange400,
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ติดเชื้อสะสม', style: kTextmaxStyle),
          Text('${f.format(_dataSundayAPI.cases)}', style: kTextCasesStyle),
          Text('(+ ${f.format(_dataSundayAPI.newConfirmed)})',
              style: kTextTodaycasesStyle),
        ],
      )),
    );
  }

  buildrecovered() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 200,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blue800,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('รักษาอยู่ใน รพ.', style: kTextminStyle),
                Text('${f.format(_dataSundayAPI.active)}',
                    style: kTextmaxStyle),
                Text('(${f.format(_dataSundayAPI.newHospitalized)})',
                    style: kTextminStyle),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightblueaccent700,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('อาการหนัก', style: kTextminStyle),
                Text('${f.format(_dataSundayAPI.critical)}',
                    style: kTextmaxStyle),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: teal800,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('หายแล้ว', style: kTextminStyle),
                Text('${f.format(_dataSundayAPI.recovered)}',
                    style: kTextmaxStyle),
                Text('(+ ${f.format(_dataSundayAPI.todayRecovered)})',
                    style: kTextminStyle),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bluegrey800,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('เสียชีวิต', style: kTextminStyle),
                Text('${f.format(_dataSundayAPI.deaths)}',
                    style: kTextmaxStyle),
                Text('(+ ${f.format(_dataSundayAPI.newDeaths)})',
                    style: kTextminStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildtitleupdate() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('อัปเดตข้อมูลล่าสุด : ${_dataSundayAPI.updateDate}'),
          // SizedBox(height: 10),
          // Text('DevBy Kidpech Pianpithak'),
          // Text('DataAPIBy ${_dataSundayAPI.devBy}'),
        ],
      ),
    );
  }

  buildtitlecovid() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_wv4mTG.json',
              width: 160,
              fit: BoxFit.cover),
          Text("วิธีป้องกันไวรัสโคโรน่า 2019", style: kTextTitleHeadStyle),
        ],
      )),
    );
  }

  buildlottie() {
    return Container(
      height: 310,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 250,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Column(
              children: [
                Lottie.network(
                    'https://assets1.lottiefiles.com/private_files/lf30_oGbdoA.json',
                    width: 160),
                Text("สวมหน้ากากอนามัย", style: kTextheadmaxStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      " ก่อนออกจากบ้าน สวมหน้ากากอนามัยทุกครั้ง ห้ามใส่หน้ากากซ้ำเด็ดขาด", style: kTextheadminStyle),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Column(
              children: [
                Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_CYBIbn.json',
                    width: 160),
                Text("ล้างมือบ่อย ๆ", style: kTextheadmaxStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      " ถูให้สะอาดทุกซอกทุกมุม แนะนำให้ล้างด้วยน้ำสบู่ หรือถ้าเป็นเจลล้างมือที่มีส่วนผสมของแอลกอฮอล์อย่างน้อย 70%", style: kTextheadminStyle),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets7.lottiefiles.com/private_files/lf30_UChCq9.json',
                    width: 160),
                Text("เว้นระยะห่างทางสังคม", style: kTextheadmaxStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      " อยู่ให้ห่างจากคนที่จาม หรือไอที่ระยะ 1-3 เมตร เพื่อความปลอดภัยสูงสุด ", style: kTextheadminStyle),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Column(
              children: [
                Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_AxmMba.json',
                    width: 160),
                    Text("อยู่บ้าน", style: kTextheadmaxStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      " อยู่บ้าน หยุดเชื่อ เพื่อคนที่คุณรัก เลี่ยงการเดินทางที่ไม่จำเป็น หรือเดินทางไปในพื้นที่เสี่ยง อยู่แต่บ้านจะปลอดภัยที่สุด", style: kTextheadminStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
