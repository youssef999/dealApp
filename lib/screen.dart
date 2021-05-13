import 'package:fire99/register2.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'adsManger.dart';
import 'package:firebase_admob/firebase_admob.dart';

class screen extends StatefulWidget {
  final String ud;
  screen(this.ud);
  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  final _nativeAd = NativeAdmobController();
  AdmobBannerSize bannerSize;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobInterstitial intersitialAd;
  AdmobReward reward;
  int coins = 0;

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  RewardAdAndLoad() {
    RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId,
        targetingInfo: MobileAdTargetingInfo());

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
          if (event == RewardedVideoAdEvent.rewarded)
            {          coins += rewardAmount;
            }

      };
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
    RewardAdAndLoad();

    bannerSize = AdmobBannerSize.BANNER;

    intersitialAd = AdmobInterstitial(
        adUnitId: AdmobInterstitial.testAdUnitId,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) intersitialAd.load();
          //  handleEvent(event, args, 'Interstitial');
        });
    _nativeAd.reloadAd(forceRefresh: true);
    intersitialAd.load();

    void showSnackBar(String content) {
      scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(content),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }

  @override
  void dispose() {
    intersitialAd.dispose();
    _nativeAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          iconTheme: IconThemeData(color: Colors.red),
          title: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                // Colors.white,
                Colors.indigo[900],
                //Colors.lightBlueAccent,
                Colors.indigo[900],
                // Colors.lightBlueAccent,
                //Colors.white,
              ])),
              height: 30,
              child: Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  /* Container(
                 width:80,
                 child:Image.asset('assets/l1.jfif')
               ),*/
                  Text("Coin",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 23)),
                  Text("s",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23)),
                  //  Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
                ],
              ))),
          //backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            SizedBox(
              height: 10,
            ),
          ]),
      body: Container(
          child: ListView(children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.indigo[900],
                  child: Text(
                    'get Coins ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w900),
                  ),
                  onPressed: () async{
                    await RewardedVideoAd.instance.show();
                  },
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 120,
                height: 70,
                child: Card(
                  child: Center(
                      child: Text(
                    "Coins = " + coins.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w900),
                  )),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(width: 70, child: Image.asset('assets/images/money.png')),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            color: Colors.red,
            width: 400,
            height: 60,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            color: Colors.orange,
            width: 400,
            height: 60,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.green,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.blue,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.pinkAccent,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.cyan,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            color: Colors.orange,
            width: 400,
            height: 60,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.green,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.blue,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.pinkAccent,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 200,
            height: 60,
            color: Colors.cyan,
            child: NativeAdmob(
              adUnitID: AdsManger.nativeAdunit,
              numberAds: 3,
              controller: _nativeAd,
              type: NativeAdmobType.banner,
            )),
        SizedBox(
          height: 15,
        ),
      ])),
    );
  }
}
