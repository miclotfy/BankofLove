import 'package:bankoflove/core/app_export.dart';
import 'package:bankoflove/screens/SignIn.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_image_view.dart';

class StScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0, 23,0,0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0,0,115),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0,0,42,0),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn(),
                                ));
                              },
                              child: Text('Skipp',style: TextStyle(fontSize: 20,color: Colors.red),),
                            )
                          ),
                        ),
                        Container(
                          width: getHorizontalSize(
                            256,
                          ),
                          margin: getMargin(
                            top: 87,
                          ),
                          child: Text(
                            "Add your memo\n in your bank ",
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                36,
                              ),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                            )//AppStyle.txtRobotoRomanSemiBold36,
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            397,
                          ),
                          width: double.maxFinite,
                          margin: getMargin(
                            top: 54,
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgOutdoor,
                                height: getVerticalSize(
                                  276,
                                ),
                                width: getHorizontalSize(
                                  389,
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgClippathgroup,
                                height: getSize(
                                  88,
                                ),
                                width: getSize(
                                  88,
                                ),
                                alignment: Alignment.topLeft,
                                margin: getMargin(
                                  left: 5,
                                  top: 77,
                                ),
                              ),
                              CustomImageView(
                                imagePath:
                                ImageConstant.img3626667removebgpreview,
                                height: getVerticalSize(
                                  244,
                                ),
                                width: getHorizontalSize(
                                  309,
                                ),
                                alignment: Alignment.topRight,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: getMargin(
                            left: 155,
                            top: 53,
                            right: 155,
                          ),
                          padding: getPadding(
                            left: 27,
                            top: 16,
                            right: 27,
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.redA700,
                          ),
                              //.fillRedA700.copyWith(
                            //borderRadius: BorderRadiusStyle.circleBorder22,
                          //),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: getSize(
                                  10,
                                ),
                                width: getSize(
                                  10,
                                ),
                                margin: getMargin(
                                  left: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: getSize(
                                  10,
                                ),
                                width: getSize(
                                  10,
                                ),
                                margin: getMargin(
                                  left: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
