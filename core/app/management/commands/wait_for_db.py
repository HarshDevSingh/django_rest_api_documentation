import time
from psycopg2 import OperationalError as PsycopgOperationalError
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand

class Command(BaseCommand):
    """ Django command to wait for database """
    def handle(self, *args, **options):
        """Entry point for command"""
        self.stdout.write("Waiting for database....")
        db_up = False
        while db_up is False:
            try:
                self.check(databases=['default'])
                db_up = True
            except(PsycopgOperationalError,OperationalError):
                self.stdout.write(self.style.WARNING("Database unavailable.... waiting 1 sec"))
                time.sleep(1)
        self.stdout.write(self.style.SUCCESS("Database ready!"))
        


