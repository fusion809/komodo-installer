# Komodo Installer
This repository contains scripts for installing Komodo Edit from the binary tarballs provided by the Komodo Edit website.

To install Komodo using the `quick-install.sh` script run (assuming cURL is installed):

```bash
/bin/bash -c "$(curl -sL https://git.io/vrGbs)"
```

while if you have wget but not cURL installed run:

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vrGbs)"
```
