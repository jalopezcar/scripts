#!/bin/bash

rm -rf app/cache/*
rm -rf app/logs/*

sudo chmod +a "_www allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
sudo chmod +a "jalopez allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs