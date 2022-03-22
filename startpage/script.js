// Change this to your username
const determineGreet = hours => document.getElementById("greeting").innerText = `Good ${hours < 12 ? "Morning," : hours < 18 ? "Afternoon," : "Evening,"} R owo.`;

// The same as "onload"
document.addEventListener('load', (_e) => {
    const today = new Date();
    const time = today.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    dark_colors()
    determineGreet(new Date().getHours());
    displayTime(time);
});

setInterval(function () {
    const today = new Date();
    const time = today.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    document.getElementById("time").innerHTML = time;
}, 1000);


function displayTime(time) {
    document.getElementById("time").innerHTML = time;
}

function dark_colors() {
    const link = document.getElementsByTagName('a');
    document.getElementById("greeting").style.color = "#dee3de";
    for (i = 0; i < link.length; i++) 
        link[i].style.color = "#bbb";
}

//Do not allow searching if the user clicks "GO" when the search box is empty
function check_if_search_empty(e) {
if (document.forms["search_eng_form"]["q"].value == "") {
    e.preventDefault();
}}

//Check if the given search is actually a website and go to it
function check_if_search_is_website(_e) {
    if (document.forms["search_eng_form"]["q"].value.startsWith("http://") || document.forms["search_eng_form"]["q"].value.startsWith("https://")) {
        window.location.href = document.forms["search_eng_form"]["q"].value
    }
}

document.getElementById("go_btn").addEventListener("click", function(){
    check_if_search_empty(event);
    check_if_search_is_website(event);
});

document.addEventListener('keydown', e => {
    if (e.keyCode === 13) {
        check_if_search_empty(e);
        check_if_search_is_website(e);
    }
})

