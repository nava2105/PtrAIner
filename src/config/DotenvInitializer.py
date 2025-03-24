from dotenv import load_dotenv
import os

load_dotenv()

db_host = os.getenv("DATABASE_HOST")
db_port = os.getenv("DATABASE_PORT")
db_name = os.getenv("DATABASE_NAME")
db_user = os.getenv("DATABASE_USER")
db_password = os.getenv("DATABASE_PASSWORD")