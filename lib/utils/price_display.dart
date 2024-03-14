import 'package:flutter/material.dart';

class PriceDisplay extends StatelessWidget {
  final String price;
  final String sale;
  final double scale;
  final Color color;
  const PriceDisplay({super.key, required this.price, required this.sale,this.scale = 1,this.color = const Color.fromRGBO(25, 118, 210, 1)});

  @override
  Widget build(BuildContext context) {
    bool isOnSale = !(sale == "0");
    String priceAfterSale = isOnSale
        ? (double.parse(price) -
                (double.parse(price).ceil() * (double.parse(sale) / 100)))
            .toStringAsFixed(2)
        : price;
    return Container(
        child: Row(
      children: [
        isOnSale
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                width: 50*scale,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "-$sale%",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 14*scale
                        ),
                  ),
                ),
              )
            : SizedBox(
                width: 50*scale,
              ),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 5*scale,
              ),
              (isOnSale)
                  ? SizedBox(
                      width: 50*scale,
                      child: Text(
                        "$price\$",
                        style: TextStyle(
                          fontSize: 14*scale,
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,
                          decorationThickness: 1.5*scale,
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 50*scale,
                    ),
              SizedBox(
                width: 5*scale,
              ),
              SizedBox(
                width: 50*scale,
                child: Text(
                  "$priceAfterSale\$",
                  style: TextStyle(color: Colors.white,
                  fontSize: 14*scale
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
