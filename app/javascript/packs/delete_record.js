const csrfToken = document.querySelector("[name='csrf-token']").content

async function deleteThis(element){
  await fetch(`${window.location.href}`,{
    method: 'DELETE',
    headers: {
      "X-CSRF-Token": csrfToken
    }
  })
  window.location.replace("http://localhost:3000/");
}
window.addEventListener("load", () => {
  const links = document.querySelectorAll(
    "#delete"
  );
  links.forEach((element) => {
    element.addEventListener("click", (event) => {
      event.preventDefault();
      deleteThis(element);
    });
  });
});