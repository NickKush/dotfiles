
#!/bin/bash
set -o xtrace

# Download and manage font

FOLDER="/tmp/nerdfont"

mkdir ~/.local/share/fonts

mkdir -p ${FOLDER} && \
    curl -s -L --create-dirs -o ${FOLDER}/JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip" && \
    unzip ${FOLDER}/JetBrainsMono.zip *.ttf -d ~/.local/share/fonts

rm -r ${FOLDER}
