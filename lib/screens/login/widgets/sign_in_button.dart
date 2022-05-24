import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  final String imageLocation;
  final String signInType;
  final Function onPressed;

  const SignInButton({
    required this.signInType,
    required this.imageLocation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final scale = ScreenUtil().scaleText;
    return Container(
      width: ScreenUtil().setWidth(273),
      height: ScreenUtil().setHeight(56),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setWidth(30.76),
              width: ScreenUtil().setWidth(30.76),
              child: Image.asset(imageLocation),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 7 * scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          signInType,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
