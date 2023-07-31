#!/usr/bin/env bash
#Saut le ligne LF
# Display test environment variable

cat << EOF
Test environment:

Compose Project : ${COMPOSE_PROJECT_NAME}
Compose File    : ${COMPOSE_PROJECT_FILE}
Image tag       : ${TAG}

EOF
