let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("slide");
    if (n > slides.length) {slideIndex = 1} 
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none"; 
    }
    slides[slideIndex-1].style.display = "block"; 
} 

const dotmenu = document.getElementsByClassName("user-page-review-dot-style");

for(let item of dotmenu){
    item.addEventListener("click", function(){
        item.nextElementSibling.style.display = "inline-block";
    });
    item.nextElementSibling.addEventListener("click", function(){
        item.nextElementSibling.style.display = "none";
    });
}

const suportbutton = document.getElementsByClassName("suport-button");

for(let item of suportbutton){
    let count = 0;
    let flag = false;
    
    item.addEventListener("click", function(){

        if(flag == false){
            item.firstElementChild.style.color = "black";
            item.style.textDecoration = "underline";
            count++;
            flag = true;
        } else {
            item.firstElementChild.style.color = "#757575";
            item.style.textDecoration = "none";
            count--;
            flag = false;
        }

        if (count == 0){
            item.parentElement.previousElementSibling.style.display = "none";
            // item.parentElement.previousElementSibling.style.visibility = "hidden";

            // item.parentElement.previousElementSibling.style.maxHeight= "0px";
        } else {
            // item.parentElement.previousElementSibling.style.visibility = "visible";
            // item.parentElement.previousElementSibling.style.maxHeight= "300px";
            item.parentElement.previousElementSibling.style.display = "flex";
            item.parentElement.previousElementSibling.innerHTML = count + "개의 도움이 되는 리뷰";


            
        }
    });

}