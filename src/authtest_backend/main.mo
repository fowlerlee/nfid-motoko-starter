import Principal "mo:base/Principal";
import types "types";

shared ({ caller }) actor class Defi() {

  let ic : types.IC = actor ("aaaaa-aa");

  public shared query ({ caller }) func greet(name : Text) : async Text {
    assert not Principal.isAnonymous(caller);
    return "Thanks for verifying, " # name # "! " # "Your PrincipalId is: " # Principal.toText(caller);
  };

};
