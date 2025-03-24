import psycopg
from .DotenvInitializer import db_host, db_port, db_name, db_user, db_password

class DbConfig:
    def __init__(self):
        self.host = db_host
        self.port = db_port
        self.dbname = db_name
        self.user = db_user
        self.password = db_password
        self.connect_timeout = 10
        self.sslmode = "prefer"

    def get_connection(self):
        return psycopg.connect(
            host=self.host,
            port=self.port,
            dbname=self.dbname,
            user=self.user,
            password=self.password,
            connect_timeout=self.connect_timeout,
            sslmode=self.sslmode
        )
