from redis import Redis
import json


r = Redis(host = '127.0.0.1', port = 6379, decode_responses = 'UTF-8')

# r.set('action2', 'alredy started')
# print(r.get('action2'))

print(r.get('action'))

redis_dict = {
    'key': 'value',
    'key1': 'value1',
}

redis_dict = json.dumps(redis_dict)

r.set('dict', redis_dict)

print(r.get('dict'))