// $(document).ready(function(){
//   $(".guest-choice").click(function(){
//     $(this).toggleClass("active");
//   });
// });


const guest_choice = document.querySelector('.guest-choice');
guest_choice.addEventListener('click', (event) => {
  evnet.currentTarget.classList.toggle("active")
});
