from talon import Module, actions
from datetime import datetime

mod = Module()

@mod.action_class
class Actions:
    def insert_current_date():
        """Inserts the current date into the active application"""
        current_date = datetime.now().strftime("%Y-%m-%d")  # Format: YYYY-MM-DD
        actions.insert(current_date)
