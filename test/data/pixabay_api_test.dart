import 'package:about_flutter_clean_architecture/data/pixabay_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pixabay_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('pixabay test', () async {
    final api = PixabayApi();

    final client = MockClient();
    const uri = '${PixabayApi.baseUrl}?key=${PixabayApi.apiKey}&q=iphone&image_type=photo';
    when(client.get(Uri.parse(uri))).thenAnswer(
      (_) async => http.Response(fakeJsonBody, 200),
    );

    final result = await api.fetch('iphone', client: client);

    expect(result.length, 20);

    verify(client.get(Uri.parse(uri)));
  });
}

String fakeJsonBody =
    """{"total":8668,"totalHits":500,"hits":[{"id":2681039,"pageURL":"https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/","type":"photo","tags":"phone wallpaper, watercolor, painting","previewURL":"https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg","previewWidth":99,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g3f1668eff7b2e4fe1f6f7b929270a0282d2c19c3f55447f1b0d65220bda188784a00a5b34d1ab1bef3a67c456418a91c813661758e5a1de64b69df92b3d859a6_640.jpg","webformatWidth":424,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/ga095f40febd666d1cce76cdba19efc4cd42cb93d0138a4afe688f9003977e15e0816f8234eec1b76a80a2e97a4cf34a8374bbe4fa77beba71ac9d23c8a7dc7ba_1280.jpg","imageWidth":3264,"imageHeight":4928,"imageSize":5021313,"views":1000108,"downloads":769795,"collections":1871,"likes":1183,"comments":126,"user_id":4894494,"user":"eluela31","userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"},{"id":1599527,"pageURL":"https://pixabay.com/photos/phone-wallpaper-mystery-island-1599527/","type":"photo","tags":"phone wallpaper, mystery, island","previewURL":"https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg","previewWidth":116,"previewHeight":150,"webformatURL":"https://pixabay.com/get/gfe27a8aafe002b339706f5877b483f128281a0d40d6cc31d7db0aa0ffc0009bf8d2299107fdd5e9548739b9425ac74063185bebb4c7938c99c959bfab921d60e_640.jpg","webformatWidth":495,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g5752122eba4a86f135ad4a0c9536734f14cc11658c6f537735bd101cadc72b5dbcc94b650ae34c7b70d8b1dd885fa1ffdcb2d38919f339ac87346f95a23fbdd3_1280.jpg","imageWidth":3022,"imageHeight":3907,"imageSize":3563541,"views":649406,"downloads":332827,"collections":1362,"likes":1320,"comments":158,"user_id":2633886,"user":"intographics","userImageURL":"https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"},{"id":620817,"pageURL":"https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/","type":"photo","tags":"office, notes, notepad","previewURL":"https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g9b4c515706db8856c8424dc53445b26707153d5b8d66a8bce0b70cf33177950dc3245a1db023b62fd97ab03c591fd8c5_640.jpg","webformatWidth":640,"webformatHeight":425,"largeImageURL":"https://pixabay.com/get/g9f3eda84f472999195360156ef532a3133c1b666717cf66d02b8212610eee51fcde44b5934878d3090c29f37b1e232a3d9f9b93ed47b54a14c3c00e4ec81ade7_1280.jpg","imageWidth":4288,"imageHeight":2848,"imageSize":2800224,"views":721545,"downloads":315958,"collections":1319,"likes":1115,"comments":260,"user_id":663163,"user":"Firmbee","userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"},{"id":1914130,"pageURL":"https://pixabay.com/photos/phone-wallpaper-spices-spoons-salt-1914130/","type":"photo","tags":"phone wallpaper, spices, spoons","previewURL":"https://cdn.pixabay.com/photo/2016/12/17/18/51/spices-1914130_150.jpg","previewWidth":133,"previewHeight":150,"webformatURL":"https://pixabay.com/get/gd661c0c9983acbf907a5172962cd4236e8029b9e94f5a1c263d7bd2e81be2a4d63c742725b9eb01f65ccaf0e396f591156c111569f1c43ffe360677207b5ce3d_640.jpg","webformatWidth":571,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g715bf7c46d25609354d85c0dbcf28c9c9ddb2e3103b96afee96b032f2f3ce9d7db89fe22a4a3a3612a1b2bc5f2dcad3bca38c57f1572e115850eee95404136a6_1280.jpg","imageWidth":3581,"imageHeight":4013,"imageSize":6193655,"views":399708,"downloads":262097,"collections":1153,"likes":1209,"comments":159,"user_id":3938704,"user":"Daria-Yakovleva","userImageURL":"https://cdn.pixabay.com/user/2016/12/06/15-05-11-524_250x250.jpg"},{"id":1979674,"pageURL":"https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/","type":"photo","tags":"relaxing, lounging, saturday","previewURL":"https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg","previewWidth":150,"previewHeight":102,"webformatURL":"https://pixabay.com/get/gd35abe1723e8b0bc5b892ac31553cf2fcf3128b81717f5467534d9f2313fda2f4afb1b1ac55c40c7e6115bf292b049a575a49498fbbb5ff2cd78b5dff7567689_640.jpg","webformatWidth":640,"webformatHeight":438,"largeImageURL":"https://pixabay.com/get/g455505271a38ba19053b67674e21786676f3718fa80d59775551603c1842125c29b540bf3cc5a8ae48be2f4c3fe1cd30f17a7f134d4932538b85e58900f15485_1280.jpg","imageWidth":5310,"imageHeight":3637,"imageSize":3751070,"views":393731,"downloads":226589,"collections":1018,"likes":1147,"comments":143,"user_id":334088,"user":"JillWellington","userImageURL":"https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"},{"id":410324,"pageURL":"https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/","type":"photo","tags":"iphone, smartphone, apps","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/gd22010f79ba4a2d0cbb4e18ec42082a83864a07216f46dc3596188f481cd9d2c21ec58b98556d1c8620c56e1c8ec200b_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gbccff8073aff3d24425d29aa0c883f9fadd6773a348e0b5e63df62145b63974307122477919c1a38ef8f3b20fa986c6a7abbf4c980480c2078c67b3024963e1f_1280.jpg","imageWidth":2180,"imageHeight":1453,"imageSize":477025,"views":718560,"downloads":420762,"collections":888,"likes":788,"comments":210,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":2846221,"pageURL":"https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/","type":"photo","tags":"business, computer, mobile","previewURL":"https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g30a161c35d5ee4595b2492832df6a766f563a27134d2c514293a813639a85938742e1765afa6f2050b4db6f16567b190f05019bc482e308729be96a7efdbede8_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gcc9f87101f05e7f794bcb9b95dfe1679a7e9a1988d2309ac080c9d6d2180f3c2c89aade96922c6de800663c4b30d28314350222054e28744824c61c53e2a69e6_1280.jpg","imageWidth":4608,"imageHeight":3072,"imageSize":2543501,"views":393770,"downloads":281214,"collections":1041,"likes":622,"comments":98,"user_id":6689062,"user":"6689062","userImageURL":""},{"id":459196,"pageURL":"https://pixabay.com/photos/macbook-laptop-google-display-459196/","type":"photo","tags":"macbook, laptop, google","previewURL":"https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg","previewWidth":150,"previewHeight":92,"webformatURL":"https://pixabay.com/get/g725dc83e38166dece86530f1405a441f456626aad3ec19a8fdc1a580c32b4eb7faf117cc2623a1a1894749d9f28decdc_640.jpg","webformatWidth":640,"webformatHeight":396,"largeImageURL":"https://pixabay.com/get/g7c526c3da98f5485d73869314bb7cc7e695b600e50cccb5af2140530e1b752c5ce0125c8cad2b72759defc964f1be8180f4ff6d901d2bb2da45bde544a12e9be_1280.jpg","imageWidth":3888,"imageHeight":2406,"imageSize":2883743,"views":555897,"downloads":281937,"collections":793,"likes":752,"comments":213,"user_id":377053,"user":"377053","userImageURL":""},{"id":1213475,"pageURL":"https://pixabay.com/photos/phone-wallpaper-heart-clouds-sky-1213475/","type":"photo","tags":"phone wallpaper, heart, clouds","previewURL":"https://cdn.pixabay.com/photo/2016/02/21/12/09/heart-1213475_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g0c0862775d49acd0274fec0071663f2902a33298a44e0ecb86e53036692a6b9b43a780b8de536526ef78a2676e29545341ab98908e6beada4398c262cf385a30_640.jpg","webformatWidth":427,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/ga42abd99c04f192678e2d2b5f1b795d9eba69133e732f8bf411d05f13966eb746c70653ec5872b85df0b5338f47e5b62c29479345d8c1e53c9cab254c90ce8af_1280.jpg","imageWidth":1667,"imageHeight":2500,"imageSize":656080,"views":592740,"downloads":422839,"collections":773,"likes":789,"comments":104,"user_id":848168,"user":"oo11o","userImageURL":""},{"id":586268,"pageURL":"https://pixabay.com/photos/telephone-mobile-call-samsung-586268/","type":"photo","tags":"telephone, mobile, call","previewURL":"https://cdn.pixabay.com/photo/2015/01/02/00/01/telephone-586268_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g949850047006d49d7a3d732d41e1018c2af9b2c218af9475c7d643617eaa7a4074bcb489b302e1791e442f74291d806c_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g2266b2249f9f622020453b13a85dca92f236724e576f48f68e37313556a979c494d44359e701d9ec91ad98a6cfa6e08888d9c489be30c49afebf4b64c11252f4_1280.jpg","imageWidth":3711,"imageHeight":2474,"imageSize":1772256,"views":163944,"downloads":98278,"collections":1349,"likes":200,"comments":57,"user_id":80788,"user":"niekverlaan","userImageURL":"https://cdn.pixabay.com/user/2014/05/19/00-26-35-848_250x250.jpg"},{"id":3746423,"pageURL":"https://pixabay.com/photos/ruin-castle-middle-ages-dramatic-3746423/","type":"photo","tags":"ruin, castle, middle ages","previewURL":"https://cdn.pixabay.com/photo/2018/10/14/13/01/ruin-3746423_150.jpg","previewWidth":106,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g6b86c619612535a5aeda43cf0357be46ee1e366283cdbc774217b023087685027121010f28c59650604c4f9287ed1bc81cf76d9ad900cbf10df7bf4dd76f1659_640.jpg","webformatWidth":452,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gfc7ce5485680b9e0eab54dece18d790c4b84040199d52a989ba80341503ce998c5ed9c68fbd1f2965b7a42a094e91e20f721f024266ef2657d5a31f79b16810a_1280.jpg","imageWidth":3508,"imageHeight":4961,"imageSize":4680479,"views":292122,"downloads":250636,"collections":816,"likes":681,"comments":132,"user_id":1664300,"user":"Darkmoon_Art","userImageURL":"https://cdn.pixabay.com/user/2022/09/27/12-51-07-71_250x250.jpg"},{"id":3076954,"pageURL":"https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/","type":"photo","tags":"desk, smartphone, iphone","previewURL":"https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g492c7f85728c3d69be607fd82c0a5f894384ae37996d6d8e333a7b0733127095f76063eced7e45394ef0a45e8d05d093a9cde2d071e0f61bf42c2b1ca40e1422_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g3709aca867b6d7e56a9bbd4e55efd0797309706e6713b3cb43e2771dea2f4a9a7db2c4f27be745ae93b4c54165abb45335374ca96f9eb0a7f4dc5fb51b301382_1280.jpg","imageWidth":5304,"imageHeight":3531,"imageSize":2258922,"views":237453,"downloads":152504,"collections":904,"likes":568,"comments":102,"user_id":2218222,"user":"Ylanite","userImageURL":"https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"},{"id":1842202,"pageURL":"https://pixabay.com/photos/camera-phone-picture-capture-1842202/","type":"photo","tags":"camera, phone, picture","previewURL":"https://cdn.pixabay.com/photo/2016/11/20/08/33/camera-1842202_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/ge951328c93def596db288ca053ca388d417190e27686607ae6ce7b481025a19c04a62560c31f7fe212da2b8fa71df91d43d93f5c1874e93649de17b03a6d661e_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g5b6182c84c1dd4d1e95ac52e72e80683b12e514026b1efe53b09de96211ff0bd1885670ca1fa40e8eeb9501fbf9ec07be7006cbd5ec5db25151ea2fcf9689c44_1280.jpg","imageWidth":5472,"imageHeight":3648,"imageSize":2581728,"views":81230,"downloads":45893,"collections":1359,"likes":127,"comments":26,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":298243,"pageURL":"https://pixabay.com/photos/smoke-abstract-background-fumes-298243/","type":"photo","tags":"smoke, abstract, background","previewURL":"https://cdn.pixabay.com/photo/2014/03/25/22/53/smoke-298243_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/gc98ac427ded3abc589be3bc8919bbade30cb59bd536d7bbd363b51e8651cfcf1d077e5445089dee0bb5445b1fa1048c7_640.jpg","webformatWidth":425,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gd97f4c3145dc58e563a6da59b9956a877145e81dfaa04aff9c48c6b3811968756fa52010810926acd6adde4b47cb57c2c782957a80d5924dcf95697a69e73926_1280.jpg","imageWidth":2848,"imageHeight":4288,"imageSize":2236073,"views":536254,"downloads":381624,"collections":740,"likes":632,"comments":103,"user_id":168090,"user":"goranmx","userImageURL":""},{"id":1659054,"pageURL":"https://pixabay.com/photos/grass-lawn-garden-park-ground-1659054/","type":"photo","tags":"grass, lawn, garden","previewURL":"https://cdn.pixabay.com/photo/2016/09/10/12/40/grass-1659054_150.jpg","previewWidth":81,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g4c088809871a982449464795f880a4900ebe26bb3ebc96ec94caa7c45ae2d143db84deb737680addfc49ac131bc103365e9bd836e510fe9df356c74a0b84cb48_640.jpg","webformatWidth":346,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g834f9c6cf43b16256ae3d0cbfca732ebf234272f00f37c0c8a05bea11491ab869441ce8042730be564a12ae57d25ae78c7bb6a2cd3e82b0de2aeea82cb7dbd1e_1280.jpg","imageWidth":2659,"imageHeight":4911,"imageSize":8444898,"views":397767,"downloads":319345,"collections":772,"likes":601,"comments":88,"user_id":1594796,"user":"jeonsango","userImageURL":"https://cdn.pixabay.com/user/2016/04/22/14-26-25-744_250x250.jpg"},{"id":2369664,"pageURL":"https://pixabay.com/photos/art-multicoloured-to-dye-abstract-2369664/","type":"photo","tags":"art, multicoloured, to dye","previewURL":"https://cdn.pixabay.com/photo/2017/06/03/20/12/art-2369664_150.jpg","previewWidth":99,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g274253f6ac428a71e314c553e7b89ec84052d5211dc2cbe544d27ff8f2751add4c60634a4b01ddb63356fb2f75c17f663052dc7afa2aae095b2f21acfb4bb4cf_640.jpg","webformatWidth":424,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g1c84728551f5c7a2e039a1f07c0252f8562771aee0127f5e21b7a3f2713f0a3e74e0e7d8fa734c976f3bdbfc660770718e7e5e4ae0766d8662cb95e8477a4c2b_1280.jpg","imageWidth":3264,"imageHeight":4928,"imageSize":4032363,"views":463557,"downloads":411905,"collections":819,"likes":562,"comments":65,"user_id":4894494,"user":"eluela31","userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"},{"id":410311,"pageURL":"https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/","type":"photo","tags":"iphone, hand, screen","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/gaf6a4e6cd4a7a67f2266002bf2de1ce59edbde6e411cd0946cdd6651d613ee8d864576ad21029400fac496e021d528ef_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g7bbd1797975808fd7f38a0156da0d7fc8ccc363e12c7b11b447565e1a5df07155ca2deddf6df64e56c87ab892c8043148e5dcdaa8678380fd2122af218c6fbe4_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":416413,"views":522815,"downloads":261352,"collections":632,"likes":601,"comments":163,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":500291,"pageURL":"https://pixabay.com/photos/iphone-hand-girl-smartphone-500291/","type":"photo","tags":"iphone, hand, girl","previewURL":"https://cdn.pixabay.com/photo/2014/10/23/20/51/iphone-500291_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g9782b499e5f8b2f807812d5b1311236fe3d61ac1052da48ba672f364afdd14a268547b23f3d052f0681c5539ccde8925_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gd9e61c4ddac791cc0f58f1aeffcde683f6d1b757ec146cc66563a1a5ff0a11563e4dfbb38a16b14e7c005b89a95ebf8b858613b0566426fc7687843f812f3af6_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":521447,"views":160792,"downloads":79398,"collections":1039,"likes":252,"comments":46,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":1052023,"pageURL":"https://pixabay.com/photos/glasses-book-phone-iphone-1052023/","type":"photo","tags":"glasses, book, phone","previewURL":"https://cdn.pixabay.com/photo/2015/11/19/21/14/glasses-1052023_150.jpg","previewWidth":150,"previewHeight":112,"webformatURL":"https://pixabay.com/get/g788a475574e95ac4be78680de9a4fd78609c851508e2314ef6fbdd866407552a8f30ddbd76322f08b4aa2f1716e51eaf68b9750733fa0c55c1f2ef61b3c2a320_640.jpg","webformatWidth":640,"webformatHeight":480,"largeImageURL":"https://pixabay.com/get/g01b8ce80c9cb59601ac48159dfeb4fb4cf6b93b7855b1f6b24a2b8b18fc010d5483d3d3b846bee8880d76dbb4cd013eac2cf6b11a412c512d976f6cef59432ae_1280.jpg","imageWidth":4533,"imageHeight":3400,"imageSize":3219890,"views":274634,"downloads":166888,"collections":644,"likes":590,"comments":80,"user_id":1441456,"user":"DariuszSankowski","userImageURL":"https://cdn.pixabay.com/user/2015/12/21/10-54-58-771_250x250.jpg"},{"id":1850893,"pageURL":"https://pixabay.com/photos/morning-bedroom-bed-door-girl-1850893/","type":"photo","tags":"morning, bedroom, bed","previewURL":"https://cdn.pixabay.com/photo/2016/11/22/22/18/morning-1850893_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g25f95c56dd7fcef16585ff02062679fc0b0001cd0970b67cd42c0dca7be233b545582de65a97d1d6ca37a73a92d44ec14c32cc99a5411307775762edac1bd267_640.jpg","webformatWidth":426,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gc412911c789eccaaa8748cd403f97a29ffa4b52b6959785610164abb744bb76580cfa6fa3600e6fa313ad168e640c57be9cb958082d8b86dfe41a54f36a46ec2_1280.jpg","imageWidth":3264,"imageHeight":4896,"imageSize":1383694,"views":160531,"downloads":101625,"collections":665,"likes":462,"comments":43,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"}]}""";
