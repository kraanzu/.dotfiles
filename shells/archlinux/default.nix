{
  mkShell,
  pkgs,
  ...
}:
mkShell {
  packages = with pkgs; [
    docker
  ];

  shellHook = ''
    # Get the current working directory
    CURRENT_DIR=$(pwd)

    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
      # Set the current directory as a safe directory for Git
      git config --global --add safe.directory "$PWD"

      # Turn off git tracking of file permissions
      git config core.fileMode false
    fi

    # Run the docker container with the current directory mounted to /shared
    docker run -it --rm -v "$CURRENT_DIR:/shared" archlinux bash -c "
      # Sync the latest mirrors
      pacman -Sy --noconfirm archlinux-keyring
      pacman -Sy --noconfirm

      # Install required packages
      pacman -S --noconfirm base-devel neovim git fish tmux sudo python3

      # Create user and add sudo permissions
      useradd -m -G wheel -s /usr/bin/fish test
      echo 'test ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/test

      # Set the permissions on /shared to allow read and write for all users
      chmod -R 777 /shared

      # Create a symlink from /home/test/shared to /shared
      ln -s /shared /home/test/shared

      # Switch to 'test' user and start 'fish' shell
      sudo -u test -i fish
    "

    # Exit the nix shell after exiting the docker container
    exit
  '';
}

