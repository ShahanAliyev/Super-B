from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework import serializers
from django.contrib.auth import get_user_model
from User.models import SubsciriberEmail

User = get_user_model()


class UserDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = (
            'id',
            'username',
            'email',
            'first_name',
            'last_name',
        )


class CustomTokenObtainSerializer(TokenObtainPairSerializer):

    def validate(self, attrs):
        data = super().validate(attrs)
        user = self.user
        serializer = UserDetailSerializer(user)
        data.update(serializer.data)
        return data


class SubscriberEmailSerializer(serializers.ModelSerializer):

    class Meta:
        model = SubsciriberEmail
        fields = (
            'email',
        )