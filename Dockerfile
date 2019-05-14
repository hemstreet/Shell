FROM silex/emacs
MAINTAINER hemstreet

#ADD spacemacs .emacs.d
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

RUN echo 'ln -sf /mnt/.emacs.d $HOME' >> $HOME/.bashrc

CMD ["/bin/bash"]