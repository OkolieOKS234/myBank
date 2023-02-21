import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float"

actor myBank{
stable var currentValue: Float = 200;
currentValue :=300;
stable var startTime = Time.now();
startTime := Time.now();
Debug.print(debug_show(startTime)); 

Debug.print(debug_show(currentValue));
Debug.print("Hello you are welcome");



 
// To create a function in Motoko
//You need to add a modifier called public
//we can use dfx cannister call mybank <function_name>

//this is how to create a function
public func topUp(amount: Float){
  
 currentValue +=amount;
  Debug.print(debug_show(currentValue));
  
 
}
;
//Challenge 
// create function that allows users to withdraw an amount from the currentValue
//decrease the current value by the amount

public func withdraw(withdrawAmount: Float){
  let tempValue: Float = currentValue - withdrawAmount;
  if(tempValue >=0){
  currentValue -=withdrawAmount;
  Debug.print(debug_show(currentValue))
}
else{
  Debug.print("Unfortunately your balance is low")
 }
};

// A query call
public query func checkBalance(): async Float {
return currentValue;
};
// Tracking the time
public func compound(){
  let  currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS/1000000000;
  currentValue := currentValue * (20 ** Float.fromInt(timeElapsedS));
// Resetting the value of startTime
startTime:= currentTime;

};

}