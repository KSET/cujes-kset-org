from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from config import Config

cujes_app = Flask(__name__)
cujes_app.config.from_object(Config)
db = SQLAlchemy(cujes_app)
migrate = Migrate(cujes_app, db)

from cujes import routes  # noqa
# noqa makes flake8 ignore the PEP-8-non-compliant import
