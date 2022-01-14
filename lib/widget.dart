import 'package:flutter/material.dart';

Color bgcolor = const Color(0xff2e88f0);
Color txcolor = const Color(0xFF080808);
Color txc = const Color(0xffffc3a2);
Color color = const Color(0xff425c5a);
Color bgc = const Color(0xffa2bfbd);

class GoodMorning extends StatelessWidget {
  const GoodMorning({
    Key key,
     this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.fromLTRB(15, 15, 10, 0),
      height: size.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hii..",
                style: TextStyle(
                    fontSize: 30, color: color, fontWeight: FontWeight.w700),
              ),
              Text(
                "Tarun verma",
                style: TextStyle(
                    fontSize: 30, color: color, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80"),
          )
        ],
      ),
    );
  }
}

class SecondList extends StatelessWidget {
  const SecondList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 250,
        decoration: BoxDecoration(
            color: Color(0xffd9eefa), borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Lucknow",
                  style: TextStyle(
                      fontSize: 25,
                      color: txcolor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "23",
                  style: TextStyle(
                      fontSize: 35,
                      color: txcolor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                  child: Column(
                    children: [
                      Text(
                        "wind Speed",
                        style: TextStyle(
                            fontSize: 17,
                            color: txcolor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "200",
                      )
                    ],
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffd9eefa),
              backgroundImage: AssetImage("assets/images/weather02-512.webp"),
            )
          ],
        ),
      ),
    );
  }
}

class Lucknow extends StatelessWidget {
  const Lucknow({
    Key key,
     this.lucknowdata,
  }) : super(key: key);

  final List lucknowdata;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
            // width: size.width * 0.90,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 2, color: Colors.black.withOpacity(0.3)),
                color: color,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.only(top: 5, left: 10),
            height: 200,
            child: ListView.builder(
                itemCount: lucknowdata == null ? 0 : lucknowdata.length,
                itemBuilder: (context, index) {
                  var data = lucknowdata[index];
                  final speed = data["wind_spd"] * 3.6;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['city_name'],
                              style: TextStyle(
                                  color: txc,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  data['temp'].toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: txc,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "o",
                                  style: TextStyle(fontSize: 17, color: txc),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    "C",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: txc,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Humidity:  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: txc,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      data['rh'].toString() + "%",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: txc,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Wind Speed:  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: txc,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "${speed.round()}" + " km/h",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: txc,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Percipitation:  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: txc,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      data['precip'].toString() + "%",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: txc,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.weatherbit.io/static/img/icons/" +
                                    data['weather']['icon'] +
                                    ".png"),
                            Text(
                              data['weather']['description'],
                              style: TextStyle(
                                  fontSize: 17,
                                  color: txc,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                })));
  }
}

class Searchresult extends StatelessWidget {
  const Searchresult({
    Key key,
     this.weatherdata,
  }) : super(key: key);

  final List weatherdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgc,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: weatherdata == null ? 0 : weatherdata.length,
            itemBuilder: (context, index) {
              var data = weatherdata[index];
              final speed = data["wind_spd"] * 3.6;
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 80),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: color,
                      child: Column(
                        children: [
                          // Expanded(
                          //     child: Positioned(
                          //         top: 20,
                          //         left: 10,
                          //         child: Container(
                          //           height: 42,
                          //           width: 42,
                          //           color: Colors.white,
                          //         ))),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            data['city_name'],
                            style: TextStyle(
                                color: txc,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                data['temp'].toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: txc,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "o",
                                style: TextStyle(fontSize: 17, color: txc),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  "C",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: txc,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.network(
                              "https://www.weatherbit.io/static/img/icons/" +
                                  data['weather']['icon'] +
                                  ".png"),
                          Text(
                            data['weather']['description'],
                            style: TextStyle(
                                fontSize: 17,
                                color: txc,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Humidity:  ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: txc,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                data['rh'].toString() + "%",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: txc,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Wind Speed:  ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: txc,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${speed.round()}" + " km/h",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: txc,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Percipitation:  ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: txc,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                data['precip'].toString() + "%",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: txc,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
