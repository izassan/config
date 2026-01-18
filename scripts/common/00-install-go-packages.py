import os

packages = [
    "github.com/junegunn/fzf@latest",
    "github.com/izassan/maskcmd@latest",
]

command = "go install"

for pkg in packages:
    print("installing package: {}".format(pkg))
    os.system("{} {}".format(command, pkg))
    print("finish installing")
    print("----------------------")
