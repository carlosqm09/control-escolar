const sidebar = document.querySelector('.sidebar');
const mainContent = document.querySelector('.main-content');
const megaItem = document.querySelectorAll('.item-mega');
document.querySelector('button').onclick = function () {
  sidebar.classList.toggle('sidebar_small');
  mainContent.classList.toggle('main-content_large')
  megaItem.forEach((item)=>{
    item.classList.toggle('show')
  })
}