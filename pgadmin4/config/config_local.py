import logging

SERVER_MODE = True
UPGRADE_CHECK_ENABLED = False
DEBUG = True
CONSOLE_LOG_LEVEL = logging.DEBUG

DATA_DIR = '/var/opt/pgadmin4/'

ALLOW_SPECIAL_EMAIL_DOMAINS = ["arpa", "invalid", "local", "localhost", "onion", "test"]
SESSION_EXPIRATION_TIME = 365

X_FRAME_OPTIONS = ""
CROSS_ORIGIN_OPENER_POLICY = "unsafe-none"
ENHANCED_COOKIE_PROTECTION = False
WTF_CSRF_ENABLED = False
