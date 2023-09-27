# uld-docker

**uld-docker** is a containerized solution for running [ulozto-downloader](https://github.com/setnicka/ulozto-downloader) with the enhancements introduced in [PR #173](https://github.com/setnicka/ulozto-downloader/pull/173) by the talented @filo891. This project is based on the original [uld-docker](https://github.com/pkejval/uld-docker) by @pkejval and has been forked to provide compatibility for Apple Silicon Macs.

## Installation

### Docker Hub

```bash
$ docker pull mifka01/ulozto-downloader
```

### Manual
To get started with **uld-docker**, follow these steps:

1.  Clone the repository to your local machine:
    ```bash
    $ git clone https://github.com/mifka01/uld-docker.git
    ```
2.  Build the Docker image and tag it as `uld-docker`:

    ```bash
    $ docker build --tag uld-docker .
    ```

With the installation complete, you can now run **ulozto-downloader** using the Docker container. Here's how you can do it:

```bash
$ docker run uld-docker [arguments]
```

Replace `[arguments]` with the actual arguments you want to pass to **ulozto-downloader**.

Alternatively, you can set up a `zsh` alias for the command, making it even more convenient. Add the following alias to your shell configuration file (e.g., `~/.zshrc`):

```
alias uld='docker run --rm -v ~/uld-output:/downloads uld-docker'
```

In this alias:

- `uld` is the custom command you can use.
- `~/uld-output` is the folder on your local system where the downloaded files will be stored.

Once you've added the alias, you can run **ulozto-downloader** as follows:

`$ uld "url"`

Replace `"url"` with the actual URL you want to download using **ulozto-downloader**.
