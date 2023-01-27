import time
from celery import shared_task


@shared_task
def export():
    print('export process started')
    time.sleep(10)
    print('export process ended')