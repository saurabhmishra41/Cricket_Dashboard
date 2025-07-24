let striker=document.querySelector("#index2-striker");
let nstriker=document.querySelector("#index2-nstriker");
let bowler=document.querySelector("#index2-bowler");
const index2Btn=document.querySelector("#index2-btn");

index2Btn.addEventListener("click",()=>{

if(striker.value!=="" && nstriker.value!=="" && bowler.value!=="")
{
  localStorage.setItem("index2-striker",striker.value);
  localStorage.setItem("index2-bowler",bowler.value);
  localStorage.setItem("index2-nstriker",nstriker.value);
  window.location.href="dashboard.html";
}


})
