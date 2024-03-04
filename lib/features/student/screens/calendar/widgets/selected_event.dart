import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/features/student/model/calender_events_model.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class SelectedEvents extends StatelessWidget {
  final bool onEventSelected;
  final List<CalendarEventsModel> selectedEventsList;
  final DateTime selectedDay;
  const SelectedEvents(
      {super.key,
      required this.onEventSelected,
      required this.selectedEventsList,
      required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SDeviceUtils.getScreenHeight() * 0.5,
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: Text(
                "Events on ${DateFormat.yMMMMd().format(selectedDay).toString()}",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          (!onEventSelected)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 104, 104, 104),
                            borderRadius: BorderRadius.circular(2.5)),
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
                        "No Events Available",
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: selectedEventsList.length,
                      itemBuilder: (context, index) {
                        String title = selectedEventsList[index].event;
                        String status = selectedEventsList[index].status;
                        Color statusColor = Colors.black;
                        statusColor = SHelperFunctions.getEventStatusColor(
                            status: status);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Container(
                                height: 20.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                    color: statusColor,
                                    borderRadius: BorderRadius.circular(2.5)),
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                title,
                              )
                            ],
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
