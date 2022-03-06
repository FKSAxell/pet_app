import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/models/place_model.dart';
import 'package:pet_app/src/services/places_service.dart';
import 'package:pet_app/src/widgets/custom_divider.dart';

class LugaresPage extends StatelessWidget {
  const LugaresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Lugares",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          CustomDivider(),
          SizedBox(height: 20),
          _Tiendas(),
          _Parques(),
        ],
      ),
    );
  }
}

class _Parques extends StatelessWidget {
  const _Parques({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Parques",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<Place>>(
              future: PlacesServices.getPlacesPark(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Place> data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      Place place = data[index];
                      return Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              place.image,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(place.name),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, size: 15),
                              Expanded(
                                child: Text(
                                  place.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Tiendas extends StatelessWidget {
  const _Tiendas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tiendas",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 250,
          child: FutureBuilder<List<Place>>(
            future: PlacesServices.getPlacesStore(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Place> data = snapshot.data!;
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemExtent: 150,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Place place = data[index];
                    return Card(
                      elevation: 1,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            place.image,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 150,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.location_on),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  place.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
