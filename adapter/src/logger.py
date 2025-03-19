import logging
from logging.config import dictConfig


def initLogger():
    dictConfig({
        'version': 1,
        'formatters': {
            'default': {
                'format': '[%(asctime)s] %(levelname)s in %(module)s: %(message)s',
            },
        },
        'handlers': {
            'console': {
                'class': 'logging.StreamHandler',
                'level': logging.DEBUG,
                'formatter': 'default'
            },
            'file': {
                'class': 'logging.FileHandler',
                'filename': 'komica.log',
                'level': logging.DEBUG,
                'formatter': 'default'
            },
        },
        'loggers': {
            # root logger
            '': {
                'level': logging.DEBUG,
                'handlers': ['file', 'console'],
            },
        }
    })
    logging.debug(f'__name__ "{__name__}"')
    logging.debug(f'third-party lib imported')
