@echo off
IF %1.==. GOTO NO_ARGS
IF %2.==. GOTO NO_ARGS
pip install pyinstaller 
pip install --upgrade ./pyarmor-5.2.3-py2.py3-none-any.whl

powershell -c "rm -fo ~/.pyarmor_capsule.zip*"

pyarmor capsule --upgrade ~/
pyarmor licenses -e %2 CODE
powershell -c "Compress-Archive -Update licenses/CODE/license.lic -DestinationPath ~/.pyarmor_capsule.zip"
powershell -c "sleep 0.1"
pyarmor pack -e='--onefile' -O ./ %1

powershell -c "rm -fo -r ~/.pyarmor_capsule.zip "
powershell -c "rm -fo -r licenses "
exit

:NO_ARGS
    ECHO "Usage: install.sh python-file YYYY-MM-DD"
    exit
