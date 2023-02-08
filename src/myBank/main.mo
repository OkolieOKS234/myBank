import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor myBank{
stable var currentValue: Nat = 1200;


Debug.print(debug_show(currentValue));
Debug.print("Hello you are welcome");
 
// To create a function in Motoko
//You need to add a modifier called public
//we can use dfx cannister call mybank <function_name>

//this is how to create a function
public func topUp(amount: Nat){
  
 currentValue +=amount;
  Debug.print(debug_show(currentValue));
  
 
}
;
//Challenge 
// create function that allows users to withdraw an amount from the currentValue
//decrease the current value by the amount

public func withdraw(withdrawAmount: Nat){
  let tempValue: Int = currentValue - withdrawAmount;
  if(tempValue >=0){
  currentValue -=withdrawAmount;
  Debug.print(debug_show(currentValue))
}
else{
  Debug.print("Unfortunately your balance is low")
 }
};

// A query call
public query func checkBalance(): async Nat {
return currentValue;
}
}