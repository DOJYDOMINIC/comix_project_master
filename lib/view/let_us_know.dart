import 'package:comix_project_master/constant/teststyle.dart';
import 'package:comix_project_master/constant/texts.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class LetUsKnow extends StatelessWidget {
  const LetUsKnow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let Us Know !',
              style: black_b_x,
            ),
            Container(
                width: 200,
                child: Text(TextLine.choose_your,style: black_iii,)),
            SizedBox(height: 30,),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),

              itemCount: 9,
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 100,
                    // width: 50,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        color: ColorApp.grey_color,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              },
            ),
            SizedBox(height: 40,),
            Container(
              width: 200,
              height: 65,
              decoration: BoxDecoration(
                  color: ColorApp.red_color,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(child: Text('Continue',style: white_b_v,)),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton( onPressed: () {  },child: Text('Skip for now',style:grey_i,),),
                Icon(Icons.arrow_forward_ios,color:ColorApp.grey_color,size: 16,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
