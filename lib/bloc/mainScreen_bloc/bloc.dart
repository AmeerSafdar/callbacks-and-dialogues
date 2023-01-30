
// ignore_for_file: unnecessary_string_interpolations, use_rethrow_when_possible

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task5/bloc/mainScreen_bloc/events.dart';
import 'package:task5/bloc/mainScreen_bloc/states.dart';
import 'package:task5/helper/const/const.dart';

class MainBlocs extends Bloc<MainScreenEvents,States>{
  Future<PermissionStatus>? status;
  MainBlocs():super(States()){
  on<DialCalls>(_dialCall);
  on<Location>(_location);
  on<Storage>(_storage);
  on<SMS>(_sms);
}

_dialCall(DialCalls event, Emitter<States> emit) async{

  status = permission_handler.askPermission(Permission.phone);
  if (await status!.isDenied == true) {
    emit(
      state.copyWith(
        status: Status.denied
      )
   );
  } 
  else if(await status!.isPermanentlyDenied == true){
   emit(
      state.copyWith(
        status: Status.permamentDenied
      )
   );
  }
  else if(await status!.isGranted == true) {
    emit(
      state.copyWith(
        status: Status.callState
      )
   );
  }
}

_location(Location event, Emitter<States> emit) async{

  status = permission_handler.askPermission(Permission.location);
  if (await status!.isDenied == true) {
    emit(
      state.copyWith(
        status: Status.denied
      )
   );
    
  } 
  else if(await status!.isPermanentlyDenied == true){
    emit(
      state.copyWith(
        status: Status.permamentDenied
      )
   );
  }
  else if(await status!.isGranted == true) {
    emit(
      state.copyWith(
         status: Status.locationState
      )
    );
  }

}
_storage(Storage event, Emitter<States> emit) async {
  status = permission_handler.askPermission(Permission.storage);
  if (await status!.isDenied == true) {
   emit(
      state.copyWith(
        status: Status.denied
      )
   );
    
  } 
  else if(await status!.isPermanentlyDenied == true){
    emit(
      state.copyWith(
        status: Status.permamentDenied
      )
   );
  }
  else if(await status!.isGranted == true) {
    emit(
      state.copyWith(
        status: Status.storageGranted
      )
   );
  }

}

_sms(SMS event, Emitter<States> emit) async{
status = permission_handler.askPermission(Permission.sms);
  if (await status!.isDenied == true) {
    emit(
      state.copyWith(
        status: Status.denied
      )
   );
    
  } 
  else if(await status!.isPermanentlyDenied == true){
    emit(
      state.copyWith(
        status: Status.permamentDenied
      )
   );
  }
  else if(await status!.isGranted == true) {
    emit(
      state.copyWith(
        status: Status.messageState
      )
   );
  }
}

}