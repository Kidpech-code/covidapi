import 'package:covidapi/constants.dart';
import 'package:covidapi/model/covid_today.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text('อัปเดตข้อมูลล่าสุด : ${_dataSundayAPI.updateDate}'),
                    SizedBox(height: 10),
                    Text('DevBy Kidpech Pianpithak'),
                    Text('DataAPIBy ${_dataSundayAPI.devBy}'),
                  ],
                ),
              ),
            ),
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
              color: lightblueaccent700,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('รักษาอยู่ใน รพ.', style: kTextminStyle),
                Text('${f.format(_dataSundayAPI.active)}',
                    style: kTextmaxStyle),
                Text('อาการหนัก', style: kTextminStyle),
                Text('${f.format(_dataSundayAPI.critical)}',
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
        ],
      ),
    );
  }
}
