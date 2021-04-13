# NextCloud CLI

Small Bash CLI for interacting with a NextCloud server.
Authentication is currently basic http. You'll need to generate a password from your NextCloud user settings, in Security category, under the **Devices & sessions** part.

## Config & Install

Default installation directory is `/usr/local/bin`.

```bash
git clone https://github.com/Chocorean/ncc
cd ncc
bash install.sh [<bin_dir>]
```

## Supported features

* upload a single file
* download a single file

## Coming soon

* upload multiple files
* download multiple files
* list a directory
* create a directory
* remove a directory
* insecure mode should be optional

## If possible

* upload from a remote src
* print disk usage related data
* support other ways to authenticate

