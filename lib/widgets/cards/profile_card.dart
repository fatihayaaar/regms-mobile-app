import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user/user.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/screens/other/view/users_screens.dart';
import 'package:regms_flutter_client/screens/profile/view/edit_profile_screen.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  final context;

  ProfileCard({required this.user, required this.context});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProfileHeader(),
        _buildProfileActions(),
        Container(
          margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              SizedBox(height: 5),
              _buildNameAndSurname(),
              SizedBox(height: 10),
              _buildBio(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: ColorSchemeLight.kRegisterRichTextAboutColor
                        .withOpacity(0.5),
                  ),
                  SizedBox(width: 7.5),
                  _buildProfileFollowersText(
                    text: "Followers",
                    count: user.profile.followersCount.toString(),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.circle,
                    color: ColorSchemeLight.kRegisterRichTextAboutColor
                        .withOpacity(0.5),
                    size: 4,
                  ),
                  SizedBox(width: 10),
                  _buildProfileFollowersText(
                    text: "Following",
                    count: user.profile.followingCount.toString(),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }

  _buildProfileHeader() {
    return Image.asset(
      user.profile.coverPhoto!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: 100,
    );
  }

  _buildAvatar() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Avatar(
        borderColor: Colors.white.withOpacity(1),
        img: user.profile.avatar!,
        size: 35,
      ),
    );
  }

  _buildNameAndSurname() {
    return Text(
      user.profile.nameAndSurname!,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  _buildBio() {
    return Text(
      user.profile.bio!,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  _buildProfileActions() {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.fromLTRB(0, 110, 10, 0),
      child: _buildProfileEditButton("Edit", () {
        Route route = MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        );
        Navigator.push(context, route);
      }),
    );
  }

  _buildProfileEditButton(String text, void onClick()) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 33,
      child: ElevatedButton(
        style: kProfileButtonButtonStyle,
        onPressed: onClick,
        child: Text(
          text,
          style: kProfileButtonContentTextStyle,
        ),
      ),
    );
  }

  _buildProfileFollowersText({required String text, required String count}) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (_) => UsersScreen());
        Navigator.push(context, route);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
          children: [
            Text(
              count,
              style: kFollowersCountSizeTextStyle,
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: kFollowersCountTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
