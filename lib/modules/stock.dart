class Stock {
  final String symbol;
  final String name;
  final double price;
  final double analystTargetPrice;
  final double dividendYield;
  final double dividendPerShare;
  final double payoutRatio;
  final DateTime dividendDate;
  final DateTime exDividend;

  Stock({this.symbol, this.name, this.price, this.analystTargetPrice, this.dividendYield, this.dividendPerShare, this.payoutRatio, this.dividendDate, this.exDividend});

  factory Stock.fromJSON(Map<String, dynamic> json)
  {
    return Stock(
      symbol: json['Symbol'] as String,
      name: json['Name'] as String,
      price: double.parse(json['50DayMovingAverage']),
      analystTargetPrice: double.parse(json['AnalystTargetPrice']),
      dividendYield: double.parse(json['DividendYield']),
      dividendPerShare: double.parse(json['DividendPerShare']),
      payoutRatio: double.parse(json['PayoutRatio']),
      dividendDate: DateTime.parse(json['DividendDate']),
      exDividend: DateTime.parse(json['ExDividendDate']),
    );
  }
}