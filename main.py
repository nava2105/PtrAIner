from fastapi import FastAPI
from src.config.DotenvInitializer import load_dotenv
from src.config.DbConfig import DbConfig
from src.factories.RepositoryFactory import RepositoryFactory

# Load environment variables
load_dotenv()

app = FastAPI()

# Create an instance of DbConfig
db_config = DbConfig()
repository = RepositoryFactory.create_repository(db_config)

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/query/{table_name}")
async def query_table(table_name: str):
    data = repository.fetch_all(table_name)
    return {"data": data}