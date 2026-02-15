import os
import yaml
import sys
from pathlib import Path

exclude_files = ['404.md']

def scan_docs_folder(docs_path="docs"):
    docs_dir = Path(docs_path)
    if not docs_dir.exists():
        return []
    
    def build_nav_recursive(current_path, relative_to=docs_dir):
        items = []
        try:
            entries = sorted(current_path.iterdir(), key=lambda x: (not x.is_file(), x.name.lower()))
        except PermissionError:
            return items
        
        for entry in entries:
            if entry.name.startswith('.') or entry.name == '__pycache__':
                continue
            relative_path = entry.relative_to(relative_to)
            if entry.is_file() and entry.suffix == '.md' and entry.name not in exclude_files:
                title = entry.stem.replace('_', ' ').replace('-', ' ').title()
                if entry.name.lower() == 'index.md':
                    title = "Home" if current_path == docs_dir else current_path.name.title()
                items.append({title: str(relative_path).replace('\\', '/')})
            elif entry.is_dir():
                folder_name = entry.name.replace('_', ' ').replace('-', ' ').title()
                sub_items = build_nav_recursive(entry, relative_to)
                if sub_items:
                    items.append({folder_name: sub_items})
        return items
    return build_nav_recursive(docs_dir)

def update_mkdocs_base_yml(nav_structure):
    """Write only the navigation to mkdocs_base.yml"""
    output_file = Path("mkdocs_base.yml")
    # Write just the nav as a YAML dictionary
    with open(output_file, 'w', encoding='utf-8') as f:
        yaml.dump({'nav': nav_structure}, f, default_flow_style=False, sort_keys=False, allow_unicode=True)
    print(f"Successfully wrote navigation to {output_file}.")
    return True

if __name__ == "__main__":
    try:
        print("Scanning docs folder...")
        nav = scan_docs_folder("docs")
        print("Navigation structure built:")
        import json
        print(json.dumps(nav, indent=2))   # this shows you exactly what will be written
        
        if update_mkdocs_base_yml(nav):
            print("Navigation merged successfully!")
        else:
            print("ERROR: Could not update mkdocs_base.yml")
            sys.exit(1)
    except Exception as e:
        print(f"ERROR in build_nav.py: {e}")
        sys.exit(1)