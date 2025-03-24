from fastapi import FastAPI
from src.config.DotenvInitializer import load_dotenv
from src.config.DbConfig import DbConfig

# Load environment variables
load_dotenv()

app = FastAPI()

# Create an instance of DbConfig
db_config = DbConfig()

@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    db_config.connect()
    return {"message": f"Hello {name}"}
