#!/bin/bash
if test -f /tmp/archive.tar.gz; then
    mv /tmp/archive.tar.gz /tmp/archive.tar.gz.OLD
    tar acf /tmp/archive.tar.gz /etc/apt/
else
    tar acf /tmp/archive.tar.gz /etc/apt/
fi