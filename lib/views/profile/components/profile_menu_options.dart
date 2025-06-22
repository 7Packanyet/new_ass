import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/providers/notification_provider.dart';
import 'profile_list_tile.dart';

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDefaults.padding),
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.boxShadow,
        borderRadius: AppDefaults.borderRadius,
      ),
      child: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, child) {
          return Column(
            children: [
              ProfileListTile(
                title: 'My Profile',
                icon: AppIcons.profilePerson,
                onTap: () => Navigator.pushNamed(context, AppRoutes.profileEdit),
              ),
              const Divider(thickness: 0.1),
              ProfileListTile(
                title: 'Notification',
                icon: AppIcons.profileNotification,
                showBadge: notificationProvider.unreadCount > 0,
                badgeCount: notificationProvider.unreadCount,
                onTap: () => Navigator.pushNamed(context, AppRoutes.notifications),
              ),
              const Divider(thickness: 1.0, height: 24),
              ProfileListTile(
                title: 'Setting',
                icon: AppIcons.profileSetting,
                onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
              ),
              const Divider(thickness: 0.1),
              ProfileListTile(
                title: 'Payment',
                icon: AppIcons.profilePayment,
                onTap: () => Navigator.pushNamed(context, AppRoutes.paymentMethod),
              ),
              const Divider(thickness: 0.1),
              ProfileListTile(
                title: 'Logout',
                icon: AppIcons.profileLogout,
                onTap: () => Navigator.pushNamed(context, AppRoutes.loginOrSignup),
              ),
            ],
          );
        },
      ),
    );
  }
}
