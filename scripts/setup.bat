set "parent_folder=%~dp0..\"
md "%parent_folder%build"
cmake -B %parent_folder%/build -S %parent_folder%
PAUSE