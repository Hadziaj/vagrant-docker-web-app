const inputBox = document.getElementById("input-box");
const listContainer = document.getElementById("list-container");

function DodajZadanie(){
    if(inputBox.value === ''){
        alert("Musisz cos napisac!");
    }
    else{
        let li = document.createElement("li");
        li.innerHTML = inputBox.value;
        listContainer.appendChild(li);
        let span = document.createElement("span");
        span.innerHTML = "\u00d7";
        li.appendChild(span);
    }
    inputBox.value = "";
    zapiszDane();
}

listContainer.addEventListener("click", function(e){
    if(e.target.tagName === "LI"){
        e.target.classList.toggle("checked");
        zapiszDane();
    }else if(e.target.tagName === "SPAN"){
        e.target.parentElement.remove();
        zapiszDane();
    }
}, false);

function zapiszDane(){
    localStorage.setItem("data", listContainer.innerHTML);
}

function pokazZadanie(){
    listContainer.innerHTML = localStorage.getItem("data");
}

pokazZadanie();