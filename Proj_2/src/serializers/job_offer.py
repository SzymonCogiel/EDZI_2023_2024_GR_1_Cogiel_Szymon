import json
from uuid import UUID
from Proj_2.src.serializers.base import BaseSerializer


class JobOfferSerializer(BaseSerializer):

    class Meta(json.JSONEncoder):
        def default(self, obj):
            if isinstance(obj, UUID):
                return str(obj)
            elif isinstance(obj, str):
                return obj
            return super().default(obj)
