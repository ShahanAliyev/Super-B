from Order.models import BasketItem


def extras(request):

    if request.user.is_authenticated:
        basket_items = BasketItem.objects.filter(basket__is_active=True)
        return {"basket_items": basket_items}
    else:
        basket_items = ""
        return {"basket_items": basket_items}
