from redis import Redis
import time

r = Redis(host = '127.0.0.1', port = 6379, decode_responses = 'UTF-8')

# subscriber = r.pubsub()
# subscriber.subscribe('test_channel')
# for message in subscriber.listen():
#     print(message)

subscriber_email = r.pubsub()

subscriber_email.subscribe('email_channel')

for message in subscriber_email.listen():
    if message['type'] == 'message':
        print(f"Sending data {message['data']}")
        time.sleep(4)
        print(f"Message sent {message['data']}")