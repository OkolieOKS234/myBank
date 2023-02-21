import {myBank} from "../../declarations/myBank";

window.addEventListener("load", async function(){
    const currentAmount = await  myBank.checkBalance();
    document.getElementById("value").innerText = currentAmount;
})