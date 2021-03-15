document.querySelector('.deleteButton').onclick = function(){
  document.querySelector('.deleteConfirmationContainer').style.display = 'flex'
}
document.querySelector('#deleteCancel').onclick = function(){
  document.querySelector('.deleteConfirmationContainer').style.display = 'none'
}