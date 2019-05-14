Windows using Ubuntu
===
    Windows/WSL is not setup correctly for docker. Windows Ubuntu shell returns the path of `/mnt/path/to/project` where
    docker expects it to be just `/path/to/project`.
    
    Seems a bit weird to modify our Ubuntu mounting path just for docker, but it works and I don't want to spend any more time than I already have.
    
    If we want to get crafty, we can probably just strip the /mnt/ prefix and call it a day. Not sure if that will work but
    it will be a TODO for later
    
    https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly#ensure-volume-mounts-work.