FROM silex/emacs
MAINTAINER hemstreet

ENV TERM xterm-256color

# enable this line if we want to not jump directly into emacs, and instead be in a bash prompt
#CMD ["/bin/bash"]