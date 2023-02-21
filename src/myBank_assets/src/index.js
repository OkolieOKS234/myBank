import {myBank} from "../../declarations/myBank";

window.addEventListener("load", async function(){
    updateBalance();
});

document.querySelector("form").addEventListener("submit", async function(){
    // To prevent refreshing
    event.preventDefault();

    const button = event.target.querySelector("#submit-btn");
    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

button.setAttribute("disabled", true);

// ensuring you are submitting without NaN
if(document.getElementById("input-amount").value.length != 0 ){
    await myBank.topUp(inputAmount);
   

}

if(document.getElementById("withdrawal-amount").value.length !=0){
    await myBank.withdraw(outputAmount);
    
};

await myBank.compound();
updateBalance();
document.getElementById("input-amount").value = "";
document.getElementById("withdrawal-amount").value = "";

// await myBank.withdraw(outputAmount);
// Give the current balance after topUp
button.removeAttribute("disabled");
    

document.getElementById("input-amount").value = "";
})
async function updateBalance(){
    
    const currentAmount = await  myBank.checkBalance();
    document.getElementById("value").innerText = currentAmount.toFixed(2);
}