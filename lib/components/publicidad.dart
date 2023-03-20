import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Public_nativo extends StatefulWidget {
  const Public_nativo({super.key});

  @override
  State<Public_nativo> createState() => _Public_nativoState();
}

class _Public_nativoState extends State<Public_nativo> {
  final NativeAd myNative = NativeAd(
    adUnitId: "ca-app-pub-6184780932224233/8261130175",
    factoryId: '', //'adFactoryExample',
    request: AdRequest(),
    listener: NativeAdListener(),
    //Error: PlatformException (PlatformException(NativeAdError, Can't find NativeAdFactory with id: , null, null))
  );

  @override
  void initState() {
    super.initState();
    myNative.load();
  }

  @override
  void dispose() {
    super.dispose();
    myNative.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/* class Public_nativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdWidget( // Envolver el anuncio nativo con un AdWidget
      ad: NativeAd(
        adUnitId: "ca-app-pub-6184780932224233/8261130175", // El ID de tu bloque de anuncios
        factoryId: '', 
        listener: NativeAdListener(), 
        request: const AdRequest(),
        /* builder: (context, child) {
          // Aquí puedes definir la apariencia del anuncio nativo usando los widgets de Flutter
          return Container(
            // El Container puede tener otros atributos o hijos
            child: child,
          );
        }, */
      ),
    );
  }
}
 */
class Public_pantalla_compl {
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  void cargaAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-6184780932224233/9387233102',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _interstitialAd = ad;
          // Show the ad
          _interstitialAd?.show();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
}

class Publicidad_inferior extends StatefulWidget {
  const Publicidad_inferior({super.key});

  @override
  State<Publicidad_inferior> createState() => _Publicidad_inferiorState();
}

class _Publicidad_inferiorState extends State<Publicidad_inferior> {
  final AdSize adSize = AdSize(width: 320, height: 50);

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-6184780932224233/9552397401',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void initState() {
    myBanner.load();
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AdWidget(ad: myBanner),
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
  }
}
