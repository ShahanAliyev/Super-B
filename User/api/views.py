from rest_framework.generics import ListCreateAPIView
from .serializers import SubscriberEmailSerializer
from Order.api.views import GenericApiSerializerMixin
from User.models import SubsciriberEmail
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly


class SubscriberEmailView(GenericApiSerializerMixin, ListCreateAPIView):
    
    queryset = SubsciriberEmail.objects.all()
    permission_classes = [IsAuthenticated]
    serializer_classes = {
        "GET": SubscriberEmailSerializer,
        "POST": SubscriberEmailSerializer,
    }