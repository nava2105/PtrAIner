class Repository:
    def __init__(self, db_config):
        self.db_config = db_config

    def fetch_all(self, table_name):
        try:
            with self.db_config.get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(f"SELECT * FROM ptrainer.{table_name};")
                    return cursor.fetchall()
        except Exception as e:
            return {"error": str(e)}
