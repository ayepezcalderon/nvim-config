import shutil
from pathlib import Path

plugins_dir = Path.cwd() / 'lua' / 'plugins'

for f in (plugins_dir / 'configs').rglob('*.lua'):
    new_dir = plugins_dir / f.stem
    if new_dir.is_dir():
        shutil.rmtree(new_dir)

for f in (plugins_dir).rglob('*.lua'):
    Path(plugins_dir / f.stem).mkdir(exist_ok=True)

for f in plugins_dir.rglob('*.lua'):
    if f.parent.name == 'configs':
        f.rename(plugins_dir / f.stem / 'init.lua')
    elif f.parents[1].name == 'mappings':
        f.rename(plugins_dir / f.stem / 'mappings.lua')
    elif f.parent.name in ['utils']:
        f.rename(plugins_dir / f.stem / f'{f.parent.stem}.lua')
