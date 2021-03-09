window.addEventListener("resize", changeImages);
function changeImages(){
  if(window.innerWidth >= 768){
    document.getElementById('UI').setAttribute("src",'/uiDesktop.png')
    document.querySelector('#disclaimer').innerHTML = 'Female 3D character from <a href="https://icons8.com/illustrations/illustration/casual-life-3d-likes" target="_blank">icons8.com</a></div>'
  }
  else{
    document.getElementById('UI').setAttribute("src",'/ui.png')
    document.querySelector('#disclaimer').innerHTML = 'Female 3D character from<br><a href="https://icons8.com/illustrations/illustration/casual-life-3d-likes" target="_blank">icons8.com</a></div>'
  }
  if(window.innerWidth < 360){
    document.getElementById('logoIcon').setAttribute("src",'/svgs/logoIcon.svg')
  }
  if(window.innerWidth >= 360){
    document.getElementById('logoIcon').setAttribute("src",'/svgs/logoType.svg')
  }

}
changeImages();
