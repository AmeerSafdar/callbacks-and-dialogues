
enum Status {initial, callState, storageGranted, denied, permamentDenied, locationState, messageState,}

class States {
   States({
   this.status = Status.initial,
  }); 
    final Status status;
    States copyWith({
    Status? status,
  }) {
    return States(
      status: status ?? this.status,
    );
  }
}