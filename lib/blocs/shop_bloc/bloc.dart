import 'package:ankiishopii/blocs/shop_bloc/event.dart';
import 'package:ankiishopii/blocs/shop_bloc/service.dart';
import 'package:ankiishopii/blocs/shop_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAccountBloc extends Bloc<ShopAccountEvent, ShopAccountState> {
  ShopAccountBloc(ShopAccountState initialState) : super(initialState);

  @override
  Stream<ShopAccountState> mapEventToState(ShopAccountEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetShopsForYou) {
      yield* mapGetShopAccountToState(event);
    }
  }

  Stream<ShopAccountState> mapGetShopAccountToState(GetShopsForYou event) async* {
    var rs = await ShopAccountService().getAll();
    if (rs != null) {
      yield ListShopsLoaded(rs);
    } else {
      yield ShopAccountLoadingError();
    }
  }
}
