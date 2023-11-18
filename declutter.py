"""Declutter my ~/Downloads folder."""
import os

downloads = os.path.expanduser("~/Downloads/")
junk = downloads+'junk/'

os.chdir(downloads)
print('Current dir:', format(os.getcwd()))


try:
    os.mkdir(junk)
except FileExistsError:
    print('Directory already exists!')


files = os.scandir(downloads)

for f in files:
    if f.name.endswith('.pdf') and f.is_file():
        print('Moving', format(f.name), 'to junk folder')
        os.replace(downloads + f.name, junk + f.name)

files.close()
