import re
from pathlib import Path

input_dir = Path(__file__).parent
input_text = (input_dir / "new_mappings_replaced.lua").read_text()

output_dir = input_dir.parent / "post_config"

preamble = "local map = vim.keymap.set\n\n"

pattern = re.compile(r"-+\s*(\w+)\s*-+(.+?)(?=-+\s*\w+\s*-+)", re.DOTALL)
for m in pattern.finditer(input_text):
    new_file_path = (output_dir / m.group(1).lower()).with_suffix(".lua")
    new_file_text = preamble + m.group(2).strip()

    new_file_path.write_text(new_file_text)
