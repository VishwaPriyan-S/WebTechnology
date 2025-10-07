
document.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector(".btn");
  btn.addEventListener("click", () => {
    alert("Yum! Let's check the menu ");
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector(".contact-form");
  if(form){
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      alert("Thank you for contacting us! We'll get back to you soon.");
      form.reset();
    });
  }
});
