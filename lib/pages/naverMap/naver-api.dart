import 'dart:async';
import 'dart:convert';
import 'dart:developer' show log;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: dotenv.env['NAVER_CLIENT_ID'],//네이버 clientID,
      onAuthFailed: (ex) => log("********* 네이버맵 인증오류 : $ex *********"));
}



class NaverMapApiPage extends StatefulWidget {
  const NaverMapApiPage({Key? key}) : super(key: key);

  @override
  State<NaverMapApiPage> createState() => NaverMapApiPageState();
}

class NaverMapApiPageState extends State<NaverMapApiPage> {
  late NaverMapController _mapController;
  final Completer<NaverMapController> mapControllerCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final pixelRatio = mediaQuery.devicePixelRatio;
    final mapSize =
    Size(mediaQuery.size.width - 32, mediaQuery.size.height - 72);
    final physicalSize =
    Size(mapSize.width * pixelRatio, mapSize.height * pixelRatio);

    print("physicalSize: $physicalSize");

    return Scaffold(
      backgroundColor: const Color(0xFF343945),
      appBar: AppBar(
        backgroundColor: Color(0xFF86ed61), // top color of the gradient,
        title: Text('NAVER MAP API'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 현재 페이지를 스택에서 제거하여 뒤로 이동
          },
        ),

      ),
      body: Center(
          child: SizedBox(
              width: mapSize.width,
              height: mapSize.height,
              // color: Colors.greenAccent,
              child: _naverMapSection())),
    );
  }

  Widget _naverMapSection() => NaverMap(
    options: const NaverMapViewOptions(
        indoorEnable: true,
        locationButtonEnable: false,
        consumeSymbolTapEvents: false),
    onMapReady: (controller) async {
      _mapController = controller;
      mapControllerCompleter.complete(controller);
      log("onMapReady", name: "onMapReady");
    },
    onMapTapped: (nPoint, nLatLng) async {
      try {
        String address = await fetchAddressFromLatLng(nLatLng.latitude, nLatLng.longitude);
        _showAddressDialog(context, address);
      } catch (e) {
        print("주소 변환에 실패했습니다: $e");
      }
    },
  );
}

//도로명주소 가져오기
Future<String> fetchAddressFromLatLng(double latitude, double longitude) async {
  var kakaoGeoUrl =
  Uri.parse('https://dapi.kakao.com/v2/local/geo/coord2address.json?x='
      '$longitude&y=$latitude&input_coord=WGS84');
  String key = dotenv.env['KAKAO_KEY']!;//카카오 키
  var kakaoGeo = await http.get(kakaoGeoUrl, headers: {"Authorization": "KakaoAK $key"});
//jason data
  String addr = kakaoGeo.body;

  var parsedJson = jsonDecode(addr);

  String addressName =
  parsedJson['documents'][0]['road_address']['address_name'];

  return addressName;
}


void _showAddressDialog(BuildContext context, String address) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("도로명 주소"),
        content: Text(address),
        actions: <Widget>[

          ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              //여기에 navigator..
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
