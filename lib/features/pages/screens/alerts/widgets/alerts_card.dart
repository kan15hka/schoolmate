import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AlertsCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String time;
  final String receiveStatus;
  final bool receiveStatusFirst;
  const AlertsCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.receiveStatus,
    required this.receiveStatusFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //if recievestatus first is true then display today yesterday old
        if (receiveStatusFirst) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text(
              receiveStatus,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            // boxShadow: kgetBoxShadow(
            //     blackOpacity: 0.04,
            //     offset: 4,
            //     blurRadius: 3,
            //     spreadRadius: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20.0,
                ),
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
                child: Center(child: Icon(MdiIcons.checkDecagram)),
              ),
              Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "$date  $time",
                        maxLines: 10,
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                      ),
                    ),
                    //content
                    Text(
                      content,
                      maxLines: 10,
                      style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
