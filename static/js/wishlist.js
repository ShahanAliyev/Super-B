// window.addEventListener('load', async function() {
//     let response =  await fetch('/api/wishlists/')
//     let wishlists = await response.json();
//     console.log(wishlists);
// })
const csrftoken = getCookie('csrftoken');

let wishlist_buttons = document.getElementsByClassName('link-wishlist');

if(wishlist_buttons){
    Array.from(wishlist_buttons).forEach(button => {
        button.addEventListener('click', async function(event) {
            event.preventDefault()
            let version = button.getAttribute('value')
            console.log(version);
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
        console.log(response.ok);
        } )
    })
}