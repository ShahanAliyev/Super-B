let items_parent = document.getElementById('items-parent')
let grand_total = document.getElementById('grand-total')
let empty_cart_button = document.getElementById('empty_cart_button')


async function retrive_basket_items(){
    let response = await fetch('/en/api/basket_items/')
    let items = await response.json()
    await use_items(items)
}

async function use_items(items){
    items_parent.innerHTML =''
    Array.from(items).forEach(item => {
        let subtotal = parseFloat(item.version.sell_price) * parseInt(item.count)
        grand_total.innerHTML = `$ ${item.basket.total_price}`
        items_parent.innerHTML += `
        <tr class="first odd">
            <td class="image"><a class="product-image" title="" ><img width="75" height="75" alt="Women's Crepe Printed Black" src="${item.version.images[0].image}"></a></td>
            <td><h2 class="product-name"> <a>${item.version.product.brand.name} ${item.version.color.name} ${item.version.product.name} ${item.size.name}</a> </h2></td>
            <td class="a-center hidden-table"><a></a></td>
            <td class="a-center hidden-table"><span class="cart-price"> <span class="price">$${item.version.sell_price}</span> </span></td>
            <td class="a-center movewishlist"><input type="number" max="9" min="1" class="input-text qty" title="Qty" size="4" item_id=${item.id} value="${item.count}" name=""></td>
            <td class="a-center movewishlist"><span class="cart-price"> <span class="price">$${subtotal}</span> </span></td>
            <td class="a-center last"><a class="button remove-item" value=${item.id}  title="Remove item"><span><span>Remove item</span></span></a></td>
        </tr>
        `
    }); remove_items_buttons_function()
}

retrive_basket_items()
let remove_items_buttons = document.getElementsByClassName('remove-item');


async function remove_items_buttons_function(){
    Array.from(remove_items_buttons).forEach(remove_item_button=>{
        remove_item_button.addEventListener('click', async function(){
            let version = remove_item_button.getAttribute('value')
            items_parent.innerHTML =''
            let response = await fetch(`/en/api/basket_items/${version}`, {
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken
                },
                method: 'DELETE',
            }); console.log(response.ok);
               await retrive_basket_items()
        })
    })
}


let update_cart = document.getElementById('update-cart')

update_cart.addEventListener('click', function(){
    let quantities = document.getElementsByClassName('qty')
    Array.from(quantities).forEach(qty=>{
        let item_id = qty.getAttribute('item_id')
        let value = qty.getAttribute('value')
        let new_count = qty.value

        refresh_from_db(value, new_count, item_id)
    })
})

async function refresh_from_db(a,b,c){
    if (a != b){
        let response = await fetch(`/en/api/basket_items/${c}`, {
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrftoken
            },
            method: 'PATCH',
            body: JSON.stringify({
                'count': b,
            }),
        }); console.log(response.ok);
        retrive_basket_items()
    }
}


empty_cart_button.addEventListener('click', async function(){
    let basket_id = empty_cart_button.getAttribute('value')
    let response = await fetch(`/en/api/baskets/${basket_id}`, {
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken
        },
        method: 'PATCH',
        body: JSON.stringify({
            'is_active': false,
        }),
    }); console.log(response.ok);
    location.reload()
})