#!/usr/bin/env sh

dropdb sqlzoo
createdb sqlzoo
psql sqlzoo < data/create_tables.sql
