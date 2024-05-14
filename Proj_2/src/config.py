from Proj_2.src.database import init_db


def setup_database():
    init_db()


if __name__ == "__main__":
    setup_database()
    print("Database setup complete.")
