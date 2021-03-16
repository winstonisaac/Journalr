let noticeDiv = document.getElementById("noticeContent")
if(noticeDiv.innerHTML !== "<span>✖</span>"){
  document.getElementById("noticeContent").parentElement.style.display = 'flex'
  setTimeout(function(){
    document.getElementById("noticeContent").parentElement.style.display = 'none'
  }, 3100)
}
let noticeDivClose = document.querySelector("#noticeContent>span")
noticeDivClose.onclick = function(){
  document.getElementById("noticeContent").parentElement.style.display = 'none'
}