import os
import sys

packages = [
    "github.com/junegunn/fzf@latest",
    "github.com/x-motemen/ghq@latest",
    "github.com/izassan/maskcmd@latest",
]

command = "go install"

# install standard packages
for pkg in packages:
    print("installing package: {}".format(pkg))
    os.system("{} {}".format(command, pkg))
    print("finish installing")
    print("----------------------")


# install lf
if sys.platform == "win32":
    command = 'set CGO_ENABLE=0 go install -ldflags="-s -w"'
else:
    command = 'env CGO_ENABLE=0 go install -ldflags="-s -w"'
pkg = "github.com/gokcehan/lf@latest"
print("installing package: {}".format(pkg))
os.system("{} {}".format(command, pkg))
print("finish installing")
print("----------------------")
