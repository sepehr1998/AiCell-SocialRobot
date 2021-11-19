import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForbiddenItems_Page extends StatefulWidget {
  @override
  _ForbiddenItemsState createState() => _ForbiddenItemsState();
}

class _ForbiddenItemsState extends State<ForbiddenItems_Page> {

  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 900,
                  width: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child:
                  Accordion(
                    maxOpenSections: 1,
                    headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    children: [
                      AccordionSection(
                        isOpen: true,
                        leftIcon: Icon(Icons.arrow_forward, color: Colors.white),
                        header: Text('Hand Baggage Restrictions', style: TextStyle(
                          fontSize: 24,
                        ),),
                        content: Column(
                          children: [
                            Text("\u2022 You are allowed just one piece of hand luggage (with some exceptions) and this must not exceed 56cm x 45cm x 25cm. Most airlines do also allow passengers to carry a handbag too, but please check with your airline to make sure.",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text("\u2022 Your hand luggage must not contain any prohibited items and these are listed below in the 'prohibited items' section.",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 You may only carry small amounts of liquids, gels, creams and pastes. These must be in containers of 100ml or less and should be placed into one transparent, re-sealable, airtight bag (maximum size: 20cm x 20cm) which will be screened separately at security. You must make sure that all of the above items follow our guidelines in the section for 'guidance for specific items' below. ",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                          ],
                        ),
                        contentHorizontalPadding: 20,
                        contentBorderWidth: 1,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: Icon(Icons.arrow_forward, color: Colors.white),
                        header: Text('Hold Luggage Restrictions',
                          style: TextStyle(
                            fontSize: 24,
                          ),),
                        contentBorderColor: Color(0xffffffff),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2022 Liquids, creams, gels and pastes in containers over 100ml",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Sharp items including scissors",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Razor blades (razors that have the blade set into a plastic moulding are allowed in hand baggage, but other types are not)",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Knives with blades of any length",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Hypodermic needles (unless required for medical reasons, for which proof will be required)",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Tools (including multi-tools and penknives)",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Catapults",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Walking/hiking poles",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Sporting bats",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Darts",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Billiard, snooker or pool cues.",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                          ],
                        ),
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: Icon(Icons.arrow_forward, color: Colors.white),
                        header: Text('Prohibited Items',
                          style: TextStyle(
                            fontSize: 24,
                          ),),
                        contentBorderColor: Color(0xffffffff),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2022 Flammable liquids and solids",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Oxidisers such as bleaching powders",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Organic peroxides",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Tear gas devices or any gas cylinders",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Infectious substances such as live virus materials",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Wet-cell car batteries",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Magnetrons",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Instruments containing mercury - however, thermometers with mercury are permitted in hold luggage (but not hand luggage) only, if they are carried in a protective case",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Instruments containing magnets",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Fireworks",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Toy/replica guns (metal or plastic)",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Non-safety matches",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Firelighters, lighter fuel, paints or thinners",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Poisons, arsenic, cyanide or weedkiller",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Radioactive materials, acids, corrosives, alkalis or caustic soda",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Creosote, quicklime or oiled paper",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Vehicle fuel system parts which have contained fuel",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                            Text("\u2022 Party poppers",
                              style: TextStyle(
                                fontSize: 24,
                              ),),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                width: 700,
                height: 100,
                child: ElevatedButton(
                  child: Text("Back", style: TextStyle(
                      fontSize: 30
                  ),),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                  ,
                ),
              ),
            ]
        )
    );
  }
}