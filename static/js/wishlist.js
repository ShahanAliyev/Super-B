let wishlist_buttons = document.getElementsByClassName('link-wishlist');

if(wishlist_buttons){
    Array.from(wishlist_buttons).forEach(button => {
        button.addEventListener('click', async function(event) {
            event.preventDefault()
            let version = button.getAttribute('value')
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