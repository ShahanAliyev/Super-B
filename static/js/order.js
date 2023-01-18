// window.addEventListener('load', async function() {
//     let response =  await fetch('/api/wishlists/')
//     let wishlists = await response.json();
//     console.log(wishlists);
// })

let wishlist_button = document.querySelector('#add-to-wishlist')
let version = wishlist_button.getAttribute('value')
let sizes = document.getElementsByClassName('versionsizes')
const csrftoken = getCookie('csrftoken');

Array.from(sizes).forEach(size => {
    size.addEventListener('click', function(event){
        event.preventDefault()
        let final_size = document.getElementById('version_size')
        if (final_size){
            final_size.removeAttribute('id')
            size.setAttribute('id', 'version_size')
        }else{
            size.setAttribute('id', 'version_size')
        }
    })
})

wishlist_button.addEventListener('click', async function(event){
    event.preventDefault()
    let response = await fetch('/api/wishlists/', {
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken
        },
        method: 'POST',
        body: JSON.stringify({
            'version': version
        }),
    })

})

