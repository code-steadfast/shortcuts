# Shortcuts

## Complete Installation

If you just came here to install the Shortcuts, open a PowerShell terminal (version 5.1 or later) and run:

```powershell
irm https://raw.githubusercontent.com/xxthunder/shortcuts/refs/heads/develop/bin/install.ps1 | iex
```

The most important tool of Shortcuts is Keypirinha.
It provides a fast and configurable way to open your favorite tools, links and URLs.
It was started automatically after installation (you can see a *k*-icon in your taskbar's icon area).

> **Note:** Keyprinha can be used by hitting **Win+Alt+Space**.

In the small window that pops up you can search for any tool installed on your PC (e.g. type *word*) and some shortcuts we provide (e.g., type *SPL*).

> **Note:** A very important command is 'Refresh catalog', that commands Keypirinha to rescan your PC for new tools and shortcuts.

## Optional Installations

### PowerShell Core

PowerShell Core is the latest stable release of PowerShell maintained by its own community.
It can be easily installed via scoop. Again open a PowerShell terminal and run:

```powershell
scoop install pwsh
```

## Update

When you already installed Shortcuts and you want to update to the latest version, you can just hit **Win+Alt+Space** and search for update.bat.

Another possibility for updating Shortcuts is to open a PowerShell terminal and run the install command again:

```powershell
irm https://raw.githubusercontent.com/xxthunder/shortcuts/refs/heads/develop/bin/install.ps1 | iex
```

After the update, hit **Win+Alt+Space** and search for 'Refresh catalog'.
Execute this to update Keypirinha's catalog database.
After a short time the new shortcuts are available.
