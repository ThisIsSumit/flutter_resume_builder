import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:resume_builder_app/utils/routes/app_colors.dart';
import 'package:resume_builder_app/views/widgets/app_bar.dart';
import 'package:resume_builder_app/views/widgets/bg_gradient_color.dart';
import 'package:resume_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EducationalDetails extends StatefulWidget {
  const EducationalDetails({super.key});

  @override
  State<EducationalDetails> createState() => _EducationalDetailsState();
}

class _EducationalDetailsState extends State<EducationalDetails> {
  List<Education> data=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().build(context, "Educational Details"),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<data.length;i++)
                educationDetailsView(data[i],i),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(onPressed: (){
                    data.add(Education("", ""));
                    setState(() {
                    });
                  },
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(AppColors.primaryColor)),
                    label: Text("Add",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),),
                    icon: Icon(Icons.add,color: Colors.white,size: 20.sp,),),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: BgGradientColor(
        borderRadius: BorderRadius.circular(30.sp),
        child: IconButton(onPressed:(){}, icon: Icon(Icons.check,color: Colors.white,size: 40.sp)),
      ),
    );
  }

 Widget educationDetailsView(Education data,int index) {
   TextEditingController schoolLevel=TextEditingController(text: data.schoolLevel);
   TextEditingController schoolName=TextEditingController(text: data.schoolName);
    return SizedBox(
      width: 1.sw,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.sp),topRight: Radius.circular(8.sp)),
                color: AppColors.primaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Education ${index+1}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                  InkWell(
                    onTap: (){
                    this.data.removeAt(index);
                    setState(() {

                    });
                  }, child: Icon(CupertinoIcons.delete,color: Colors.white,size: 18.sp,),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Course/Degree',style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14.sp),),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      width: 1.sw,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(8.sp)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Row(
                            children: [
                              Icon(Icons.school,color: Colors.grey,size: 20.sp,),
                              SizedBox(width:8.w,),
                              Expanded(
                                child: TextField(
                                  controller: schoolLevel,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Degree Name",
                                      hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Text('College/University',style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14.sp),),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      width: 1.sw,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(8.sp)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Row(
                            children: [
                              Icon(Icons.business,color: Colors.grey,size: 20.sp,),
                              SizedBox(width:8.w,),
                              Expanded(
                                child: TextField(
                                  controller: schoolName,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "College/University",
                                      hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}