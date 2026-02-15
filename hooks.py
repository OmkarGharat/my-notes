import yaml
from pathlib import Path

def inject_nav(config):
    """Load nav from mkdocs_base.yml and insert it into the config"""
    nav_file = Path("mkdocs_base.yml")
    if nav_file.exists():
        with open(nav_file, 'r', encoding='utf-8') as f:
            nav_data = yaml.safe_load(f)
        # Expect mkdocs_base.yml to contain only a 'nav' key
        if nav_data and 'nav' in nav_data:
            config['nav'] = nav_data['nav']
    return config