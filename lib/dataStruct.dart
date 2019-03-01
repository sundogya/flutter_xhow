class Post {
  int errorCode;
  String msg;
  Body body;
  Post({this.body, this.errorCode, this.msg});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        body: Body.fromJson(json['body']),
        errorCode: json['errorCode'],
        msg: json['msg']);
  }
}

class Body {
  String LogisticCode;
  String ShipperCode;
  String State;
  bool Success;
  List<_Trace> Traces;
  List<_Shippers> Shippers;
  Body(
      {this.LogisticCode,
        this.ShipperCode,
        this.State,
        this.Success,
        this.Traces,
        this.Shippers
      }
      );
  factory Body.fromJson(Map<String, dynamic> json) {
    var list = json['Traces'] as List;
    List<_Trace> TracesList = list.map((i) => _Trace.fromJson(i)).toList();
    List<_Shippers> ShipersList = list.map((i) => _Shippers.fromJson(i)).toList();
    return Body(
        LogisticCode: json['LogisticCode'],
        ShipperCode: json['ShipperCode'],
        State: json['State'],
        Success: json['Success'],
        Traces: TracesList,
        Shippers:ShipersList,
    );
  }
}

class _Trace {
  String AcceptStation;
  String AcceptTime;
  _Trace({this.AcceptTime, this.AcceptStation});
  factory _Trace.fromJson(Map<String, dynamic> json) {
    return _Trace(
      AcceptStation: json['AcceptStation'],
      AcceptTime: json['AcceptTime'],
    );
  }
}
class _Shippers {
  String ShipperName;
  String ShipperCode;
  _Shippers({this.ShipperName, this.ShipperCode});
  factory _Shippers.fromJson(Map<String, dynamic> json) {
    return _Shippers(
      ShipperName: json['ShipperName'],
      ShipperCode: json['ShipperCode'],
    );
  }
}