import 'package:ankiishopii/global/global_function.dart';
import 'package:ankiishopii/global/global_variable.dart';
import 'package:ankiishopii/helpers/string_helper.dart';
import 'package:ankiishopii/models/ordering_model.dart';
import 'package:ankiishopii/models/product_model.dart';
import 'package:ankiishopii/models/shop_account_model.dart';
import 'package:ankiishopii/pages/account/login_page.dart';
import 'package:ankiishopii/themes/constant.dart';
import 'package:ankiishopii/widgets/add_to_cart_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/constant.dart';
import 'base/custom_ontap_widget.dart';

class CustomShopListItem extends StatefulWidget {
  final GlobalKey cartIconKey;
  final ShopAccountModel shop;
  final Color priceTextColor;
  final Color quickActionColor;

  final Function onTap;
  final Function onAddToCart;
  final Function onFavourite;
  final Color backgroundColor;
  final bool showQuickActionButtons;
  final double elevation;

  CustomShopListItem({
    this.backgroundColor = BACKGROUND_COLOR,
    this.shop,
    this.cartIconKey,
    this.onTap,
    this.onAddToCart,
    this.onFavourite,
    this.showQuickActionButtons = true,
    this.quickActionColor = FORE_TEXT_COLOR,
    this.priceTextColor = PRICE_COLOR_ON_FORE,
    this.elevation = 1,
  });

  @override
  _CustomShopListItemState createState() => _CustomShopListItemState();
}

class _CustomShopListItemState extends State<CustomShopListItem> with SingleTickerProviderStateMixin {
  final double height = 120;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey inkwellKey = GlobalKey();

    // TODO: implement build
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: widget.elevation + 10),
      child: RaisedButton(
        onPressed: widget.onTap,
        elevation: widget.elevation,
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.only(top: 10, right: 15, left: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              buildImage(),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: buildInfo()),
                    SizedBox(
                      width: 10,
                    ),
                    // buildQuickActionButton(context, inkwellKey)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      width: height - 20,
      height: height - 20,
      child: Card(
        elevation: 5,
        color: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: CachedNetworkImageProvider(widget.shop.image), fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.shop.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TEXT_STYLE_ON_FOREGROUND.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.shop.address ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(letterSpacing: 1.2, color: widget.priceTextColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.shop.phoneNumber ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TEXT_STYLE_ON_FOREGROUND.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CustomShopGridItem extends StatefulWidget {
  final GlobalKey cartIconKey;
  final ShopAccountModel shop;
  final Color priceTextColor;
  final Color quickActionColor;
  final double width;

  final Function onTap;
  final Color backgroundColor;
  final double elevation;
  final bool showQuickAction;

  CustomShopGridItem(
      {this.cartIconKey,
      this.shop,
      this.priceTextColor = PRICE_COLOR_PRIMARY,
      this.quickActionColor = FORE_TEXT_COLOR,
      this.width = 150,
      this.onTap,
      this.backgroundColor = BACKGROUND_COLOR,
      this.elevation = 1,
      this.showQuickAction = true});

  @override
  _CustomShopGridItemState createState() => _CustomShopGridItemState();
}

class _CustomShopGridItemState extends State<CustomShopGridItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.width * 1.3;
    return Container(
//      margin: EdgeInsets.only(bottom: widget.elevation),
      width: widget.width,
      height: height,
      child: RaisedButton(
        color: widget.backgroundColor,
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        onPressed: () {
          widget.onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
//
                    image: DecorationImage(image: NetworkImage(widget.shop.image), fit: BoxFit.cover),
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <Widget>[
                Text(
                  widget.shop.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TEXT_STYLE_ON_FOREGROUND.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.shop.address ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TEXT_STYLE_ON_FOREGROUND.copyWith(
                    color: PRICE_COLOR_ON_FORE,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // widget.showQuickAction ? buildQuickAction() : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildQuickAction() {
  //   GlobalKey addToCartIconKey = GlobalKey();
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       CustomOnTapWidget(
  //         onTap: () {
  //           if (currentLogin == null) {
  //             Navigator.push(context, MaterialPageRoute(builder: (b) => LoginPage()));
  //             return;
  //           }
  //           if (widget.onFavourite != null) {
  //             widget.onFavourite();
  //           }
  //         },
  //         child: Icon(
  //           widget.product.isFavoriteByCurrentUser ? Icons.favorite : Icons.favorite_border,
  //           size: 25,
  //           color: FORE_TEXT_COLOR,
  //         ),
  //       ),
  //       SizedBox(
  //         width: 10,
  //       ),
  //       ClipOval(
  //         child: Material(
  //           color: widget.quickActionColor, // button color
  //           child: InkWell(
  //             key: addToCartIconKey,
  //             splashColor: widget.backgroundColor,
  //             // inkwell color
  //             child: SizedBox(
  //                 width: 50,
  //                 height: 50,
  //                 child: Icon(
  //                   Icons.add_shopping_cart,
  //                   color: widget.backgroundColor,
  //                 )),
  //             onTap: () async {
  //               if (currentLogin == null) {
  //                 Navigator.push(context, MaterialPageRoute(builder: (b) => LoginPage()));
  //                 return;
  //               }
  //               if (widget.onAddToCart != null) {
  //                 final RenderBox box = addToCartIconKey.currentContext.findRenderObject();
  //                 final Offset position = box.globalToLocal(Offset.zero);
  //                 var dx = position.dx * -1;
  //                 var dy = position.dy * -1;
  //                 //print(dx.toString() + " - " + dy.toString());

  //                 updateCartIconPosition(cartIconKey: widget.cartIconKey);

  //                 await showAddToCartAnimation(context,
  //                     start: CustomPosition(dx, dy), end: CustomPosition(cartIconPositionDx, cartIconPositionDy));
  //                 widget.onAddToCart();
  //               }
  //             },
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
