# Komodo Installer
<p>
  <img src="http://imgur.com/q0bO5rU.png">
  <caption><b>Figure 1: Komodo Edit 9.3.2 running on CentOS 7</b></caption>
</p>
This repository contains scripts for installing Komodo Edit from the binary tarballs provided by the Komodo Edit website.

To install Komodo using the `quick-install.sh` script run (assuming cURL is installed):

```bash
/bin/bash -c "$(curl -sL https://git.io/vrGbs)"
```

while if you have wget but not cURL installed run:

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vrGbs)"
```
