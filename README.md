# HotBox - WorldEdition
## _Rebuild your box, fast and hot.._

![](ig/picture.png)

## Features

- [Chocolatey Package Management](https://chocolatey.org) for that sweet, sweet linux like package management
  
- [Boxstarter ](https://boxstarter.org/) to boss windows around, help us manage the process and a bit with OS config

- Custom sets of **Starters** and **Tasks**
- **Starters** are purpose-built wrappers. Want to set up a Malware Development station? There's a starter for that. It handles some of of the specific OS level config and calls the subsets of **Tasks**, powershell scriptlets located in `\scripts` that install various components and software like Browsers, Docker, Cloud tools, Creative apps, etc. There's a script to uninstall chocolatey if you want to clean up after yourself.
- Comment out specific packages under the **Script** to further customize your install. 


### **Starters:**

5/2022 Malwarelab_clean_windows and Newhire are the two being maintained. Anything else is old and full of holes, but so am I so chill out.


- **`boxjump`:** 
	- Standard Example for my old setup, you'll see similarities 
	- Sets execution policy and installs choco/boxstarter
	- Disables UAC, allows for reboots and logging back in Automagicakly
	- Get the base URI path from the ScriptToCall value  
	- Shows a few ways to install and kick things off
	- Sets up Windows by running these Tasks:
	
		![](ig/picture1.png) 
	
	- Sets a rad wallpaper and the Aero Theme
	- Re-enable UAC, Enables and Installs all Windows Updates
	- Needs to be re-worked, see `C2DevBox` main script  for the updated model
	
- **`dev_c2implants`:**
	- Based on boxjump
	 	
	 	![](ig/picture3.png)
	 	
	 	![](ig/picture4.png)

- **`dev_app_desktop_cplusplus`:** 

- **`malwarelab_clean_windows`:**

- **`winup`:**

- **`dev_web_nodejs`:**



### **Tasks / Scripts:**

- **`Browsers`:** Chrome, Firefox, Brave, Discord, Steam, Tor

- **`C2Dev`:** See C2DevBox Below

- **`Cloud`:** awscli azurecli doctl terraform cyberduck mremoteng vagrant packer vault kubectl

- **`CommonDevTools`:** vscode git python pip go 7zip sysinternals poshgit dotpeek

- **`CommonTools`:** microsoft-windows-terminal powertoys terminus git bitwarden vscode zeroteir notepad++ 7zip winrar sysinternals autohotkey cyberduck vlc mremoteng openvpn ngrok fiddler virtualbox putty docker-desktop

- **`Containers`:** N/A

- **`CreativeApps`:** openshot obs-studio sketchbook audacity reaper gimp yed drawio

- **`Docker`:** vscode-docker docker-desktop

- **`FileExplorerSettings`:** Settings tos how hidden folders, adds things back to the left pane...quality of life stuff

- **`HyperV`:** Install HyperV Feature

- **`MalwareAnalysis`:**

- **`NewHire`:**

- **`RemoveDefaultApps`:**

- **`SecurityTools`:**

- **`Shortcuts`:** Create shortcuts

- **`SysmonConfig`:** Install and update Sysmon config

- **`SystemConfiguration`:** A number of System Configuration tasks

- **`UninstallChoco`:** Uninstalls chocolatey

- **`Wallpaper`:** Pulls and sets wallpaper

- **`WebDev`:**

- **`Windows10DebloaterGUI`:**

- **`Windows10Sysprep`:**

- **`WinTermShortcut`:**

- **`WSL`:**

- **`WSLDistros`:**
 
### **Boxes:**


**`C2DevBox`:**  Set for .Net, Node, C/C++ Development, MingW-W64/32, includes Golang, C#, cloud tools like Terraform and Ansible, Python, VS/VS Code and a bunch of other tooling.

**`ChadBox`:** A little package I put together with a script to download a zip file of his starter and run it. He got an old tower from a friend and I wanted to see what we could do. I'm sure it can be done better: help me learn, go pull crazy.

I've included some choco and boxstarter scripts that inspired me as well, it's cool to see what you can do. 

I like to break stuff, especially my own, possibly in production. This came about so I could get back to my setup on a new system as fast as possible. Backups are great, but with OneDrive and GitHub and cloud-everything we can just dropship ourselves onto a new device pretty easily.
