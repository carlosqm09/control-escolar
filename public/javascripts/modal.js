const myModal = new bootstrap.Modal(document.getElementById('myModal'), {})
const btnAdd = document.querySelector('#btn-add')
btnAdd.addEventListener('click',()=>{
    console.log('ola :v')
    myModal.show();
})

