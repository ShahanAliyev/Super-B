// window.addEventListener('load', async function() {
//     let response =  await fetch('/api/wishlists/')
//     let wishlists = await response.json();
//     console.log(wishlists);
// })


let sizes = document.getElementsByClassName('versionsizes')
if (sizes){
    Array.from(sizes).forEach(size => {
        size.addEventListener('click', function(event){
            sizes_function(event, size)
        })
    })
}


let basket_buttons = document.getElementsByClassName('btn-cart');
if(basket_buttons){
    basket_buttons_function()
}


// function basket_buttons_function(){
//     Array.from(basket_buttons).forEach(button => {
//         button.addEventListener('click', async function(event) {
//             event.preventDefault()
//             let version = button.getAttribute('value')
//             let final_size = document.getElementById('version_size')
//             if(final_size){
                
//             }
//             let size_id = final_size.getAttribute('value')
//             let response = await fetch('/api/basket_items/', {
//             headers: {
//                 'Content-Type': 'application/json',
//                 'X-CSRFToken': csrftoken
//             },
//             method: 'POST',
//             body: JSON.stringify({
//                 'version': version,
//                 'size': size_id,
//             }),
//         })
//         console.log(response.ok);
//         } )
//     })
// }
function basket_buttons_function(){
    Array.from(basket_buttons).forEach(button => {
        button.addEventListener('click', async function(event) {
            event.preventDefault()
            let version = button.getAttribute('value')
            let final_size = document.getElementById('version_size')
            if(final_size){
                let size_id = final_size.getAttribute('value')
                let response = await fetch('/api/basket_items/', {
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken
                },
                method: 'POST',
                body: JSON.stringify({
                    'version': version,
                    'size': size_id,
                }),
            })
            console.log(response.ok);
            }else{
                alert('First You Should Choose size')
            }
        })
    })
}

function sizes_function(event, size){

    event.preventDefault()
    size.setAttribute('id', 'version_size')
    let final_size = document.getElementById('version_size')
    if (final_size){
        final_size.removeAttribute('id')
        size.setAttribute('id', 'version_size')
    }else{
        size.setAttribute('id', 'version_size')
    }
}

