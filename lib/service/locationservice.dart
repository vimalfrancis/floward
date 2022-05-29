import 'dart:async';

import 'package:background_location/background_location.dart';



void getCurrentLocation()async {
   await BackgroundLocation.setAndroidNotification(
                      title: 'Background service is running',
                      message: 'Background location in progress',
                      icon: '@mipmap/ic_launcher',
                    );
                    //await BackgroundLocation.setAndroidConfiguration(1000);
    await BackgroundLocation.startLocationService(
                        distanceFilter: 20);
    
   
   Timer timeIntervel1 = Timer.periodic(Duration(seconds: 5), (Timer t) => printLocation());

  }

 

printLocation()
  {

     BackgroundLocation().getCurrentLocation().then((location) {
      print('This is current Location ' + location.toMap().toString());
    });


  }