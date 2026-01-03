import asyncio
import logging
import os
import shutil
import sys
import zipfile
import subprocess
import aiohttp
from logger import initLogger

DOWNLOAD_FOLDER = 'download'
EXTENSION_FOLDER = 'extensions'

async def download_zip(url, pkg_name):
    """
    下載 zip 檔案至 [DOWNLOAD_FOLDER]
    """
    dist = f'{DOWNLOAD_FOLDER}/{pkg_name}.zip'
    if os.path.exists(dist):
        os.remove(dist)
    async with aiohttp.ClientSession() as session:
        response = await session.get(url)
        response.raise_for_status()
        data = await response.read()
        with open(dist, "wb") as f:
            f.write(data)


def unzip_file(pkg_name):
    """
    解壓縮至 [EXTENSION_FOLDER]/{pkg_name} 資料夾
    """
    if not os.path.exists(DOWNLOAD_FOLDER):
        os.makedirs(DOWNLOAD_FOLDER, exist_ok=True)
    if not os.path.exists(EXTENSION_FOLDER):
        os.makedirs(EXTENSION_FOLDER, exist_ok=True)
        
    dist = f'{EXTENSION_FOLDER}/{pkg_name}'
    if os.path.exists(dist):
        shutil.rmtree(dist)
    with zipfile.ZipFile(f'{DOWNLOAD_FOLDER}/{pkg_name}.zip', 'r') as zip_ref:
        zip_ref.extractall(dist)


def install_requirements(pkg_name):
    """
    安裝 {pkg_name}/requirements.txt 中的套件
    """
    req_path = f'{EXTENSION_FOLDER}/{pkg_name}/requirements.txt'
    if os.path.exists(req_path):
        subprocess.check_call([sys.executable, '-m', 'pip', 'install', '-r', req_path])


initLogger()

# When called by serious_python, __name__ is "main"
if __name__ == "__main__" or __name__ == "main":
    url = os.environ['URL']
    pkg_name = os.environ['PKG_NAME']
    logging.debug(f'url = {url}, pkg_name = {pkg_name}')
    asyncio.run(download_zip(url, pkg_name))
    unzip_file(pkg_name)
    install_requirements(pkg_name)
