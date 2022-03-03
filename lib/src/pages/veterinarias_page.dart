import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/models/place_model.dart';
import 'package:pet_app/src/services/places_service.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/widgets/custom_divider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VeterinariasPage extends StatelessWidget {
  const VeterinariasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Veterinarias",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          CustomDivider(),
          SizedBox(height: 20),
          // ExpansionTile(
          //   title: Text("Veterinaria ABC"),
          //   subtitle: Text("12:00 -18:00"),
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       color: ColorTheme.primary,
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     width: 40,
          //     height: 40,
          //   ),
          //   children: [
          //     Container(
          //       height: 40,
          //       margin: EdgeInsets.symmetric(vertical: 10),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           IconButton(
          //             splashRadius: 25,
          //             onPressed: () async {
          //               final latitude = "-2.1782683";
          //               final longitude = "-79.8234841";
          //               final url =
          //                   "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
          //               if (await canLaunch(url)) await launch(url);
          //             },
          //             icon: Icon(
          //               Icons.location_on_outlined,
          //               color: ColorTheme.primary,
          //               size: 32,
          //             ),
          //           ),
          //           VerticalDivider(
          //             thickness: 2,
          //           ),
          //           IconButton(
          //             splashRadius: 25,
          //             onPressed: () async {
          //               if (await canLaunch("tel:+593995217308"))
          //                 await launch("tel:+593995217308");
          //             },
          //             icon: Icon(
          //               Icons.phone,
          //               color: ColorTheme.primary,
          //               size: 32,
          //             ),
          //           ),
          //           VerticalDivider(
          //             thickness: 2,
          //           ),
          //           IconButton(
          //             splashRadius: 25,
          //             onPressed: () async {
          //               if (await canLaunch("https://wa.me/+593995217308"))
          //                 await launch("https://wa.me/+593995217308");
          //             },
          //             icon: Icon(
          //               FontAwesomeIcons.whatsapp,
          //               color: ColorTheme.primary,
          //               size: 32,
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          FutureBuilder<List<Place>>(
              future: PlacesServices.getPlaces(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Place> data = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          Place place = data[index];
                          return ExpansionTile(
                            title: Text(
                              place.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                                "${place.schedule.ini} - ${place.schedule.end}"),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                place.image,
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Container(
                            //     decoration: BoxDecoration(
                            //       color: ColorTheme.primary,
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //     child: Image.network(
                            //       place.image,
                            //       fit: BoxFit.cover,
                            //     ),
                            //     width: 40,
                            //     height: 40,
                            //   ),

                            children: [
                              Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      splashRadius: 25,
                                      onPressed: () async {
                                        final latitude = place.location.lat;
                                        final longitude = place.location.lng;
                                        final url =
                                            "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
                                        if (await canLaunch(url))
                                          await launch(url);
                                      },
                                      icon: Icon(
                                        Icons.location_on_outlined,
                                        color: ColorTheme.primary,
                                        size: 32,
                                      ),
                                    ),
                                    VerticalDivider(
                                      thickness: 2,
                                    ),
                                    IconButton(
                                      splashRadius: 25,
                                      onPressed: () async {
                                        final tel = "tel:${place.callphone}";
                                        if (await canLaunch(tel))
                                          await launch(tel);
                                      },
                                      icon: Icon(
                                        Icons.phone,
                                        color: ColorTheme.primary,
                                        size: 32,
                                      ),
                                    ),
                                    VerticalDivider(
                                      thickness: 2,
                                    ),
                                    IconButton(
                                      splashRadius: 25,
                                      onPressed: () async {
                                        final wapp =
                                            "https://wa.me/${place.wsphone}";
                                        if (await canLaunch(wapp))
                                          await launch(wapp);
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: ColorTheme.primary,
                                        size: 32,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
                //snapshot.hasError
              }),
        ],
      ),
    );
  }
}
