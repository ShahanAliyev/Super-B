from redis import Redis

r = Redis(host = '127.0.0.1', port = 6379, decode_responses = 'UTF-8')

r.publish('test_channel', 'Hello world')