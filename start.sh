#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "usage: ./start.sh <sitename> <dbrootpass> <dbname> <dbuser> <dbpass> <drupaladminacctname> <drupaladminpass> <listofpackages for drush wraped in quotes> <theme>"
fi

if [ $# -gt 1 ]
  then
    export SITENAME=$1
    export DBROOT=$2
    export DBNAME=$3
    export DBUSER=$4
    export DBPASS=$5
    export ACCTNAME=$6
    export ACCTPASS=$7
    export DRUSHDLLIST=$8
    export THEME=$9

    vagrant up --no-parallel
fi