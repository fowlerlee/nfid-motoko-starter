import Principal "mo:base/Principal";

actor {
  public shared query({caller}) func greet(name : Text) : async Text {
    assert not Principal.isAnonymous(caller);
    return "Thanks for verifying, " # name # "! " # "Your PrincipalId is: " # Principal.toText(caller);
  };

};