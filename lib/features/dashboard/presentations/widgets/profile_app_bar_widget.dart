import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/app_colors.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  'assets/fund_logo.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Hi, Rifat Hasan",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.notifications_active,
                            color: AppColors.primary,
                          ),
                        ],
                      );
  }
}