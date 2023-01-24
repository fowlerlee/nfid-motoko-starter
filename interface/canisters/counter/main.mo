import Principal "mo:base/Principal";

actor {
    stable var currentValue : Nat = 0;

    public func increment() : async () {
        currentValue += 1
    };

    public query func getValue() : async Nat {
        currentValue
    };

    public shared query ({ caller }) func greet(name : Text) : async Text {
        // assert not Principal.isAnonymous(caller);
        return "Thanks for verifying, " # name # "! " # "Your PrincipalId is: " # Principal.toText(caller)
    }
}
