// window.addEventListener('load', async function() {
//     let response =  await fetch('/api/wishlists/')
//     let wishlists = await response.json();
//     console.log(wishlists);
// })


let sizes = document.getElementsByClassName('versionsizes')
if (sizes){
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
}


let basket_buttons = document.getElementsByClassName('btn-cart');

if(basket_buttons){
    Array.from(basket_buttons).forEach(button => {
        button.addEventListener('click', async function(event) {
            event.preventDefault()
            let version = button.getAttribute('value')
            console.log(version);
            let response = await fetch('/api/basket_items/', {
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