from Order.models import BasketItem


def extras(request):

    if request.user.is_authenticated:
        basket_items = BasketItem.objects.filter(basket_id__user=request.user)
        return {"basket_items": basket_items}
    else:
        basket_items = ""
        return {"basket_items": basket_items}
