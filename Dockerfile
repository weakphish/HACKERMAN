# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

ARG DEBIAN_FRONTEND=noninteractive
# Update
RUN apt -y update && apt -y dist-upgrade && apt -y autoremove && apt clean

# Install Kali Linux "Top 10" metapackage and a few useful tools
RUN apt -y install vim kali-tools-top10 net-tools whois exploitdb man-db dirb nikto wpscan uniscan nodejs npm python3-pip tor proxychains

# Install some useful hardware packages
RUN apt -y install pciutils usbutils 

# Configure proxychains with Tor
COPY config/proxychains.conf /etc/proxychains.conf

# Install Zsh
RUN apt -y install git zsh && wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# Add my user
RUN useradd -ms /bin/zsh weakphish
USER weakphish
WORKDIR /home/weakphish

# Install ZSH shell with custom settings and set it as default shell
COPY config/.zshrc /home/weakphish/.zshrc

ENTRYPOINT ["/bin/zsh"]
