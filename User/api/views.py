from rest_framework.generics import ListCreateAPIView
from .serializers import SubscriberEmailSerializer
from Order.api.views import GenericApiSerializerMixin
from User.models import SubsciriberEmail


class SubscriberEmailView(GenericApiSerializerMixin, ListCreateAPIView):
    
    queryset = SubsciriberEmail.objects.all()
    serializer_classes = {
        "GET": SubscriberEmailSerializer,
        "POST": SubscriberEmailSerializer,
    }