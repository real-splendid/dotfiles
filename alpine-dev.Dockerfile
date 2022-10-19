FROM alpine:edge

# --- Args ---
ARG NEWUSER='developer'
ARG NEWGROUP='container'
ARG PUID=1111
ARG PGID=1111

# --- Install ---
RUN apk add --no-cache bash sudo make

# --- User ---
RUN addgroup -g ${PGID} ${NEWGROUP}
RUN adduser -D -G ${NEWGROUP} -u ${PUID} --shell /bin/bash "${NEWUSER}"

RUN echo "$NEWUSER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER

USER "${NEWUSER}"
WORKDIR /home/${NEWUSER}

# --- Configs ---
COPY --chown=${NEWUSER}:${NEWGROUP} ./ dotfiles
RUN cd dotfiles && sudo make

ENTRYPOINT [ "bash" ]
