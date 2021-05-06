import 'dart:convert';

import 'package:ankiishopii/blocs/bloc_service.dart';
import 'package:ankiishopii/blocs/favorite_bloc/service.dart';
import 'package:ankiishopii/helpers/http_helper.dart';
import 'package:ankiishopii/models/shop_account_model.dart';

class ShopAccountService extends BlocService<ShopAccountModel> {
  @override
  Future<ShopAccountModel> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  // @override
  // Future<List<ShopAccountModel>> getAll({int from = 0, int limit}) {
  //   // TODO: implement getAll
  //   throw UnimplementedError();
  // }

  @override
  Future<List<ShopAccountModel>> getAll({int from = 0, int limit}) async {
    // TODO: implement getAll
    var url = SHOP_ACCOUNT_ENDPOINT + '?${getQueryString({'from': from, 'limit': limit})}';
    print(url);
    var rs = await HttpHelper.get(url);
    if (rs.statusCode == 200) {
      var jsonList = jsonDecode(rs.body) as List;
      // print(jsonList.toList());
      var shops = jsonList.map((j) => ShopAccountModel.fromJson(j)).toList();
      // for (var shop in shops) {
      //   shop = _checkIsFavoriteByCurrentUser(shop);
      // }
      return shops;
    }
    return null;
  }

  //   ShopAccountModel _checkIsFavoriteByCurrentUser(ShopAccountModel shop) {
  //   var favorite = FavoriteService().getFavoriteFromLocalByProductId(shop.username);
  //   if (favorite != null) {
  //     product.isFavoriteByCurrentUser = favorite.isfavorite;
  //   }
  //   return product;
  // }
  Future<ShopAccountModel> getShopAccount(String username) async {
    var rs = await HttpHelper.get(SHOP_ACCOUNT_ENDPOINT + "/$username");
    if (rs.statusCode == 200) {
      var json = jsonDecode(rs.body);
      return ShopAccountModel.fromJson(json);
    }
    return null;
  }
}
