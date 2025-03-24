from src.repositories.Repository import Repository

class RepositoryFactory:
    @staticmethod
    def create_repository(db_config):
        return Repository(db_config)
