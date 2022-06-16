code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge
code --install-extension msjsdiag.debugger-for-firefox

choco install -y hugo
choco install -y gimp
choco install -y draw.io

# choco install -y nodejs-lts # Node.js LTS, Recommended for most users
choco install -y nodejs # Node.js Current, Latest features
choco install -y visualstudio2017buildtools
choco install -y visualstudio2017-workload-vctools
choco install -y python2 # Node.js requires Python 2 to build native modules