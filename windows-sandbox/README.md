# Elevated Windows Sandbox Launcher

A one-click shortcut that opens Windows Sandbox with administrator rights and automatically shares a folder from your PC with it. That makes it quick to open and test files in a throwaway environment that resets every time you close it.

# Usage

Double-click the Sandbox shortcut and accept the admin prompt. Windows Sandbox opens with your C:\Sandbox folder available inside it, so any file you put in that folder can be opened in the sandbox.

When you close the sandbox, everything inside it is wiped. Your files in C:\Sandbox on your PC stay where they are.

# Set-up

1. Create the folder

Create a folder at C:\Sandbox

2. Add the script

Copy elevated-wsb.ps1 into C:\Sandbox. Open it and check that any file paths point to C:\Sandbox. Change them if your setup is different.

3. Add the config file

Copy config.wsb into C:\Sandbox
 
4. Create the shortcut

Right-click inside C:\Sandbox and choose New > Shortcut.
Paste this as the location:

   C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "Start-Process 'C:\Windows\System32\WindowsSandbox.exe' -Verb RunAs -ArgumentList 'C:\Sandbox\config.wsb'"

5. Name it Sandbox and click Finish

# Notes

The shared folder is a direct link between the sandbox and your real PC. If ReadOnly is set to false, anything running inside the sandbox, including a malicious file you're testing, can change or add files on your PC.

- Keep ReadOnly set to true when opening anything suspicious.
- Set Networking to Disable when testing suspicious files, so nothing can call out to the internet or reach your home network.