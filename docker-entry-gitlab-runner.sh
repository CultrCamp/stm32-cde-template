#!/bin/bash
: ${TOKEN:=d585qZxssq4JCiJJ9vjb}
: ${REPO:=stm32f103-cmake-template}


# Unregister any previous local runners
gitlab-runner unregister --all-runners
# Nuclear unregistration in case the previous failed
rm /etc/gitlab-runner/config.toml

# Register a new runner
gitlab-runner register \
    --non-interactive \
    --limit 1 \
    --name ${REPO} \
    --url https://gitlab.com \
    --registration-token ${TOKEN} \
    --executor shell

# Run
gitlab-runner run