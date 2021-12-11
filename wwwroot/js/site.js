// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

const regexp = /(rgb\(\d+, ?\d+, ?\d+\)), (rgb\(\d+, ?\d+, ?\d+\))/g;

const body = document.querySelector("body");
const bodyBgData = getComputedStyle(body).getPropertyValue("background-image");
const colors = [...bodyBgData.matchAll(regexp), 'red', 'green'];

const firstColor = colors[0][1];
const secondColor = colors[0][2];

const navLinks = document.querySelectorAll("a");
const banners = document.getElementsByClassName("banner")

navLinks.forEach(element => {
    element.style.cssText = 'color: ' + secondColor +';';
});

// for(let i = 0; i < banners.length; i++){
//     banners[i].style.cssText += 'background: linear-gradient(45deg,' + firstColor + ', ' + secondColor + ');';
// }