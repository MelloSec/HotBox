choco install -y wsl2
wsl --set-default-version 2
choco install -y docker-desktop




# #--- Ubuntu ---
# # TODO: Move this to choco install once --root is included in that package
# Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-2004 -OutFile ~/Ubuntu.appx -UseBasicParsing
# Add-AppxPackage -Path ~/Ubuntu.appx
# # run the distro once and have it install locally with root user, unset password

# RefreshEnv
# Ubuntu2004 install --root
# Ubuntu2004 run apt update
# Ubuntu2004 run apt upgrade -y

