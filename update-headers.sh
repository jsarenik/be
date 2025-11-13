#!/bin/sh

cat <<EOF
/internal-api/*
  Content-Type "application/json; charset=UTF-8"

/.well-known/*
  Content-Type "application/json; charset=UTF-8"
EOF
