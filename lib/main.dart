import 'package:covidapi/model/covid_today.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var url = Uri.parse('https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR2gF0-_YJxG8zX1geiAwBHS4JhVR-Vpx2GIvFY29vRtGfIqkCBfdz8zYfE');
  // ignore: unused_field
  late CovidToday _dataSundayAPI;
  @override
  void initState() {
    super.initState();
    print('hello ');
    getData();
  }

  Future<void> getData() async {
    print('get data');
    var response = await http.get(url);
    print(response.body);
    
    setState(() {
      _dataSundayAPI = covidTodayFromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
      ),
      body: ListView(children: [
        ListTile(
          title: Text('ติดเชื้อสะสม'),
          subtitle: Text('${_dataSundayAPI.cases}'),
        ),
        ListTile(
          title: Text('ติดเชื้อรายวัน'),
          subtitle: Text('+ ${_dataSundayAPI.newConfirmed}'),
        ),
        ListTile(
          title: Text('เสียชีวิต'),
          subtitle: Text('${_dataSundayAPI.covidTodayDeaths}'),
        ),
        ListTile(
          title: Text('เสียชีวิตรายวัน'),
          subtitle: Text('+ ${_dataSundayAPI.todayDeaths}'),
        ),
        ListTile(
          title: Text('หายแล้ว'),
          subtitle: Text('${_dataSundayAPI.recovered}'),
        ),
        ListTile(
          title: Text('หายแล้วรายวัน'),
          subtitle: Text('+ ${_dataSundayAPI.todayRecovered}'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text('ขอบคุณข้อมูลจาก บริษัท ซันเดย์ อินส์ จำกัด', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ],),
    );
  }
}
