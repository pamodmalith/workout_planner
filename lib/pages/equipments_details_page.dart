import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/model/equipmnet_model.dart';
import 'package:workout_planner/widgets/equipment_card.dart';

class EquipmentsDetailsPage extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentDescription;
  final List<Equipment> equipmentList;

  const EquipmentsDetailsPage({
    super.key,
    required this.equipmentTitle,
    required this.equipmentDescription,
    required this.equipmentList,
  });

  @override
  State<EquipmentsDetailsPage> createState() => _EquipmentDetailsState();
}

class _EquipmentDetailsState extends State<EquipmentsDetailsPage> {
  // Date Time Format
  final DateFormat dateFormat = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    // Date Time
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${formattedDate.toUpperCase()} $formattedDay",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kSubtitleColor,
              ),
            ),
            Text(
              widget.equipmentTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.equipmentDescription,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kMainBlackColor,
                ),
              ),
              SizedBox(height: 15),

              // Equipment List
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 8 / 5,
                ),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                    equipmentName: equipment.equipmentName,
                    equipmentDescription: equipment.equipmentDescription,
                    equipmentImageUrl: equipment.equipmentImageUrl,
                    noOfMinutes: equipment.noOfMinutes,
                    noOfCalories: equipment.noOfCalories,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
