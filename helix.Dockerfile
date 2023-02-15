FROM rust:latest as helix-build

RUN apt update && apt install -y git build-essential
RUN git clone https://github.com/helix-editor/helix \
 && cd helix \
 && cargo install --locked --path helix-term


FROM golang:latest

ENV TERM=xterm-256color
ENV PATH=$PATH:/root/.local/bin

RUN apt update && apt install -y bash git tmux \
    && apt clean && rm -rf /var/lib/apt/lists/*

# --- Go ---
RUN go install golang.org/x/tools/gopls@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/jesseduffield/lazygit@latest
RUN CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

# --- PHP ---
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=19.6.0

RUN apt update && apt install -y php php-xdebug unzip \
    && apt clean && rm -rf /var/lib/apt/lists/*
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN bash -c ". /root/.nvm/nvm.sh \
        && nvm install $NODE_VERSION \
        && nvm alias default $NODE_VERSION \
        && npm i intelephense -g " \
    && echo ". ~/.nvm/nvm.sh"  >> /root/.bashrc
ENV PATH=$PATH:/root/.nvm/versions/node/v${NODE_VERSION}/bin

RUN wget https://github.com/xdebug/vscode-php-debug/releases/download/v1.31.0/php-debug-1.31.0.vsix
RUN unzip php-debug-1.31.0.vsix -d /root/php-dap
RUN echo -e "\nxdebug.mode = debug\nxdebug.start_with_request = yes\n" >> /etc/php/7.4/mods-available/xdebug.ini

COPY scripts/mycompletion.php /root/.local/bin/mycompletion

# --- Helix ---
COPY --from=helix-build /usr/local/cargo/bin/hx /root/.local/bin/
COPY --from=helix-build /helix/runtime/queries/ /root/.local/bin/runtime/queries/
COPY --from=helix-build /helix/runtime/grammars/*.so /root/.local/bin/runtime/grammars/
COPY --from=helix-build /helix/runtime/themes/ /root/.local/bin/runtime/themes/
COPY --from=helix-build /helix/runtime/tutor /root/.local/bin/runtime/tutor
COPY .config/helix /root/.config/helix
COPY .config/tmux /root/.config/tmux
COPY .config/lf /root/.config/lf
