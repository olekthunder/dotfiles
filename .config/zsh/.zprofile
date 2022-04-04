stty -ixon

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
        exec startx &> /dev/null
fi
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_AGENT_PID="$(pgrep ssh-agent")
