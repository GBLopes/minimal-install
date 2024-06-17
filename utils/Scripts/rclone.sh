#!/usr/bin/env bash

rclone mount gdrive: ~/GDrive && \
rclone sync gdrive: ~/GDrive --daemon
