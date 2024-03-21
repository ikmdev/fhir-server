
# Installation

To execute the FHIR server, we suggest using the FHIR container.  To do this, we suggest installation of Docker Desktop or Docker Community Edition (CE).

Though it is likely that this image will support container platforms such as Rancher Desktop, Minikube, or podman - it has not been 
tested to do so.  Unfortunately, there are too many permutations to list, but in general, following the guidelines on docker should 
give you the tools to use it on the other platforms as well.

## Check System Requirements:

Before installing Docker on Windows, ensure that your system meets the following requirements:
* Ensure that Hyper-V are features enabled in your BIOS (if applicable)
* It is suggested you use one of the tested operating systems:
    * Windows 10 64-bit: Pro, Enterprise, or Education (Build 15063 or later).
    * MacOS 14+
    * Ubuntu Linux

## Uninstall Previous versions of Docker

Uninstall Older Versions:
If you have any older versions of Docker installed, it's recommended to uninstall them before proceeding.

## Option 1: Installing Docker Desktop (Subscription required)

1. **Go to the Docker website** - Open [Docker Desktop Download][1] and click on the button to 
    download (choosing the appropriate OS and architecture).
2. **Execute Installer** - Open a folder to the downloaded location and execute the installer. An installer should walk your 
    through any options to install the application. Once the installation is complete, Docker Desktop should launch 
    automatically. You should see the Docker whale icon in the system tray (lower-right corner of your screen). 
    Docker Desktop is now running.

## Option 2: Install via Docker Engine and Docker CLI

If you want to avoid dealing with the licensing of running Docker with Docker Desktop, you can also run it via just command line.
This is done slightly differently for each platform.

### Windows

Windows requires Docker CLI, which will connect to a remote docker daemon, and docker machine, which will start a Linux
virtual machine running a docker daemon.  You can do this in the following way:

1. **Open Command Prompt as Administrator** - Right-click on the Start menu and 
    select "Command Prompt (Admin)" to open Command Prompt with administrative 
    privileges.
2. **Install Chocolatey (if not already installed)** - If you haven't installed 
    Chocolatey yet, you can do so by following the instructions on the 
    Chocolatey website: https://chocolatey.org/install
3. **Install Docker CLI using Chocolatey** - To install the Docker CLI, run the   
    following command in the Command Prompt:

    ```bash
    choco install docker-cli docker-machine docker-compose
    ```

For a walkthrough that does this manually (without chocolatey), you can also follow this video tutorial:
https://www.youtube.com/watch?v=i7i4vZBOpWM

### Mac

Mac requires Docker CLI, which will connect to a remote docker daemon, and docker daemon, which will execute starting a Linux
virtual machine running a docker daemon.  You can do this in the following way:

1. **Install Homebrew** (if not already installed) - Homebrew simplifies 
    the installation process for various software packages on macOS. If 
    you haven't installed Homebrew yet, you can do so by following the 
    instructions here: https://brew.sh
2. **Install Docker and Docker Compose** by executing the following command:

    ```bash
    brew install docker docker-compose
    ```

### Ubuntu/Linux

1. **Update your Package Index** by running the following command
    
    ```bash
    sudo apt update
    ```

2. **Install the dependencies** necessary to add new repositories over HTTPS
    
    ```bash
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    ```

3. **Add Docker's official GPG key to your system** by running the following command
    
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

4. Add the Docker repository to your system's software sources list:
    
    ```bash
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ```

5. **Update your Package Index** (again) by running the following command
    
    ```bash
    sudo apt update
    ```

6. Install Docker CE with the following command:

    ```bash
    sudo apt install docker-ce
    ```

7. Docker should start automatically after installation, but you can ensure it's running and set to start on boot with 
    the following commands:

    ```bash
    sudo systemctl start docker
    sudo systemctl enable docker
    ```

### Red Hat Linux 8

1. **Check Subscription** - Ensure your Red Hat Enterprise Linux (RHEL) system has an active subscription and access to the Red Hat 
repositories. Docker CE is not officially supported on RHEL without a subscription.
2. **Enable Extras Repository** - Docker packages for RHEL are available in the Extras repository. Ensure that the Extras repository is enabled on your system:

    ```bash
    sudo subscription-manager repos --enable rhel-8-for-x86_64-appstream-rpms
    ```
    
3. **Install the necessary dependencies for Docker CE** by running

    ```bash
    sudo dnf install -y yum-utils device-mapper-persistent-data lvm2
    ```

4. **Add the Docker CE Repository** by executing the following command:

    ```bash
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    ```

5. **Install Docker CE** with the following command:

    ```bash
    sudo dnf install docker-ce
    ```

## Verify Docker is Running

To verify that Docker is installed correctly, open a command prompt or 
PowerShell window and run the following command to check the Docker version:

```bash
docker --version
```

You should see output similar to this: `Docker version 20.10.8, build 3967b7d`.

[1]: https://www.docker.com/products/docker-desktop "Docker Desktop Download"
