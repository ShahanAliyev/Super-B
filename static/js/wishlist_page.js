let wishlist_items_parent = document.getElementById('wishlist_items_parent')
let all_adder = document.getElementById('add-all-to-cart')


async function get_wislist_items() {
    let response = await fetch('/api/wishlists/')
    let wishlist_items = await response.json()
    wishlist_items_parent.innerHTML = ''
    Array.from(wishlist_items).forEach(wishlist_item => {
        wishlist_items_parent.innerHTML += `
        <tr>
            <td class="wishlist-cell0 customer-wishlist-item-image"><a title="${wishlist_item.version.product.brand.name} ${wishlist_item.version.color.name} ${wishlist_item.version.product.name}" 
            href="#" class="product-image"> <img width="150" height="150" alt="Softwear Women's Designer" src="${wishlist_item.version.images[0].image}"> </a></td>
            <td data-rwd-label="Price" class="wishlist-cell3 customer-wishlist-item-price"><div class="cart-cell">
            <div class="price-box"> <span class="regular-price"> <span class="price">$${wishlist_item.version.sell_price}</span> </span> </div>
            </div></td>
            <td class="wishlist-cell4 customer-wishlist-item-cart"><div class="cart-cell">
            <button class="button turn-items-to-basket" value1=${wishlist_item.id} value2=${wishlist_item.version.id}  title="Add to Cart" type="button"><span><span>Add to Cart</span></span></button>
            </div> 
            <p><a href="#" class=""></a></p></td>
            
            <td class="wishlist-cell4 customer-wishlist-item-cart"><div class="cart-cell">
            <button class="button remove-item" value=${wishlist_item.id} title="Remove" type="button"><span><span>Remove</span></span></button>
            </div> 
            <p><a href="" class=""></a></p></td>
        </tr>
            `
        })
        remove_wishlist_buttons_function()
        remove_and_add_basket()
    }
    
    
get_wislist_items()
    
let remove_wishlist_buttons = document.getElementsByClassName('remove-item')
    
async function remove_wishlist_buttons_function(){
        Array.from(remove_wishlist_buttons).forEach(remove_wishlist_button => {
        remove_wishlist_button.addEventListener('click', async function(){
            wishlist_id = remove_wishlist_button.getAttribute('value')
            let remove_response = await fetch(`/api/wishlists/${wishlist_id}`, {
                headers:{
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken
                },
                method: "DELETE",
            }); console.log(remove_response.ok);
            get_wislist_items()
        })
    })
}
 


let turn_items_to_basket = document.getElementsByClassName('turn-items-to-basket')

async function remove_and_add_basket(){
    Array.from(turn_items_to_basket).forEach(item => {
        item.addEventListener('click', async function() {
            let wishlist = item.getAttribute('value1')
            let version = item.getAttribute('value2')
            send_to_basket(wishlist, version)
        })
    })
}


async function send_to_basket(wishlist, version){
    
    let remove_wislist_response = await fetch(`/api/wishlists/${wishlist}`, {
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken,
        },
        method: "DELETE",
    });
    let add_to_basket_response = await fetch('/api/basket_items/', {
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken,
        },
        method: "POST",
        body: JSON.stringify({
            'version': version
        })
    });console.log(remove_wislist_response.ok);
        console.log(add_to_basket_response.ok);
        get_wislist_items()
        show_basket_items()
        cart_dropdown.style.display = "block";
}


all_adder.addEventListener('click', async function(){
    Array.from(turn_items_to_basket).forEach(item => {
        let wishlist = item.getAttribute('value1')
        let version = item.getAttribute('value2')
        send_to_basket(wishlist, version)
    })
})