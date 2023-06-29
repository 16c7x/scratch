#!/bin/bash

command='su- dinpmpi1 -c \"/opt/ATSmesddb2bld/bin/dbld_create_db.ksh -d '$PT_dbname' -t TBD_AUTO -C '$PT_codeset' -P '$PT_pagesize' -S '$PT_collation' -T '$PT_territory' -r DFT -a '\'$PT_comment\'\"
echo $command > /tmp/file

return $command