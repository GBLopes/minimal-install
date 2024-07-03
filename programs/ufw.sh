#!/usr/bin/env bash

apt install -y ufw && ufw enable && ufw default deny incoming && ufw default allow outgoing