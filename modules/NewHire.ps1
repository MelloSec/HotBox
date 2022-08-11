# Installation with parameters. 
# Will select Microsoft 365 Home Premium retail edition in 32bits, only install Excel, Powerpoint and Word in French with updates disabled and EULA not accepted automatically.
# choco install office365business --forcex86 --params="/productid:O365HomePremRetail" /exclude:"Access Groove Lync OneDrive OneNote Outlook Publisher" /language:"fr-FR" /updates:"FALSE" /eula:"FALSE"

cinst office365business --params="/productid:O365ProPlusRetail" /exclude: 


cinst -y Adobe