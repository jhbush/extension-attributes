# Jamf Pro Extension Attributes

This repository contains a curated collection of macOS extension attribute scripts for Jamf Pro (formerly JAMF Casper Suite). Each script is designed to return a simple value to Jamf, which is then surfaced as a managed computer inventory attribute.

## What is included

The repo is organized by category folders, each targeting a specific class of information such as:

- antivirus and security state
- battery, hardware, and display details
- network, Wi‑Fi, and printer status
- virtual machine detection
- OS, app, and profile inventory
- user, directory, and system status

Most scripts are plain shell or Python utilities that read local macOS data and emit a single result in Jamf's expected format, typically:

```xml
<result>value</result>
```

## Using a script in Jamf

1. Add the script to Jamf Pro under Settings > Computer Management > Scripts.
2. Create a Computer Extension Attribute and select the script.
3. Scope the attribute to the computers you want to inventory.
4. View the result in Inventory or use it in Smart Groups / policies.

## Notes

- Scripts are intentionally lightweight and pull directly from Apple system tools, plists, and local configuration files.
- Some entries are old or community-derived and may require minor adjustment for current Jamf or macOS versions.
- This repository is best treated as a reference library of attribute logic rather than a single packaged product.

## Repository layout

The top-level folders group related checks by technology or vendor, for example:

- `Battery Information/`
- `Firewall/`
- `Google/`
- `Microsoft/`
- `Virtual Machines/`
- `Warranty Expires/`
- `Profiles/`

Each folder contains one or more scripts that return a specific value for a Jamf extension attribute.
