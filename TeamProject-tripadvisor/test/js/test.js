function show(){
    document.querySelector(".profile-page-background").className = "profile-page-popup profile-edit";
}

function close(){
    document.querySelector(".profile-page-background").className = "profile-page-popup";
}

document.querySelector("#profile-edit-show").addEventListener("click", show);
document.querySelector("#profile-edit-close").addEventListener("click", close);