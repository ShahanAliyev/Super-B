// window.addEventListener('load', async function() {
//     let response =  await fetch('/api/wishlists/')
//     let wishlists = await response.json();
//     console.log(wishlists);
// })
const csrftoken = getCookie('csrftoken');


let sizes = document.getElementsByClassName('versionsizes')
if (sizes) {
    Array.from(sizes).forEach(size => {
        size.addEventListener('click', function (event) {
            sizes_function(event, size)
        })
    })
}


let basket_buttons = document.getElementsByClassName('btn-cart');
let remove_buttons = document.getElementsByClassName('btn-remove1');

if (basket_buttons) {
    basket_buttons_function()
}

let cart_dropdown = document.getElementById('cart-dropdown')
let cart_sidebar = document.getElementById('cart-sidebar')


function basket_buttons_function() {
    Array.from(basket_buttons).forEach(button => {
        button.addEventListener('click', async function (event) {
            event.preventDefault()
            let version = button.getAttribute('value')
            let final_size = document.getElementById('version_size')
            if (final_size && sizes) {
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
                remove_buttons_function()
                show_basket_items()
                cart_dropdown.style.display = "block";
                console.log(response.ok);
            }
            else {
                alert('Select size to add product to your basket')
            }
        })
    })
}


function sizes_function(event, size) {

    event.preventDefault()
    size.setAttribute('id', 'version_size')
    let final_size = document.getElementById('version_size')
    if (final_size) {
        final_size.removeAttribute('id')
        size.setAttribute('id', 'version_size')
    } else {
        size.setAttribute('id', 'version_size')
    }
}


async function remove_buttons_function(){
    Array.from(remove_buttons).forEach(remove_button=>{
        remove_button.addEventListener('click', async function(event){
            event.preventDefault()
            let version = remove_button.getAttribute('value')
            let response = await fetch(`/api/basket_items/${version}`, {
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken
                },
                method: 'DELETE',
            }); console.log(response.ok);
               await show_basket_items()
        })
    })
}


async function show_basket_items() {
    let response = await fetch('/api/basket_items/');
    let items = await response.json()
    cart_sidebar.innerHTML = ''
    Array.from(items).forEach(item => {
        cart_sidebar.innerHTML += `
        <li class="item first">
        <div class="item-inner"><a class="product-image"
            title="${item.version.product.brand.name} ${item.version.color.name} ${item.version.product.name}">
            <img alt="${item.version.product.brand.name} ${item.version.color.name} ${item.version.product.name}"
              src="${item.version.images[0].image}" style="width:60px"; he></a>
          <div class="product-details">
            <div class="access">
              <a class="btn-remove1" value=${item.id} title="Remove This Item">Remove</a>
            </div>
             <strong>Size: ${item.size.name} </strong>
             <strong>Count: ${item.count}</strong> x <span class="price">$${item.version.sell_price}</span>
            <p class="product-name"><a href="#">${item.version.product.brand.name} ${item.version.color.name} ${item.version.product.name}</a></p>
          </div>
        </div>
        </li>
        `
    }); await remove_buttons_function();
}

remove_buttons_function()