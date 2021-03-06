#!/bin/bash
# ====================
# Settings for malbec2
# ====================



#set -x  # print commands and their arguments as they are executed

export BBS_DEBUG="0"

export BBS_NODE_HOSTNAME="malbec2"
export BBS_USER="biocbuild"
export BBS_RSAKEY="/home/biocbuild/.BBS/id_rsa"
export BBS_WORK_TOPDIR="/home/biocbuild/bbs-3.9-bioc"
export BBS_R_HOME="$BBS_WORK_TOPDIR/R"
export BBS_NB_CPU=10        # 20 cores are available
export BBS_CHECK_NB_CPU=15  # 20 cores are available



# Shared settings (by all Unix nodes).

wd0=`pwd`
cd ..
. ./config.sh
cd "$wd0"



# Overwrite values set in ../../config.sh and ../config.sh
export BBS_CENTRAL_RHOST="localhost"
export BBS_MEAT0_RHOST="localhost"
export BBS_GITLOG_RHOST="localhost"

# Needed only on the node performing stage6 (must be run on the
# BBS_CENTRAL_RHOST machine).
#

# If you are NOT using a bi-arch builder (i.e. moscato1 or moscato2) to
# create your Windows build products, the following note applies:

# IMPORTANT NOTE: The win.binary mapping must either include the 2
# Windows nodes (win32 and win64) or not be present at all. Temporarily
# dropping a Windows node will allow some single-arch Windows binary
# packages to propagate and to later not be replaced by the bi-arch when
# the dropped node is back.

export BBS_OUTGOING_MAP="source:malbec2/buildsrc win.binary:tokay2/buildbin mac.binary.el-capitan:celaya2/buildbin"

# Needed only on the node performing stage7a (BBS-make-STATUS_DB.py) and
# stage8 (BBS-report.py)
#
# IMPORTANT: BBS-report.py will treat BBS_REPORT_PATH as a _local_ path so it
# must be run on the BBS_CENTRAL_RHOST machine.

export BBS_REPORT_NODES="malbec2 tokay2:bin celaya2:bin"
#export BBS_SVNCHANGELOG_URL="http://fgc.lsi.umich.edu/cgi-bin/blosxom.cgi"
export BBS_REPORT_PATH="$BBS_CENTRAL_RDIR/report"
export BBS_REPORT_CSS="$BBS_HOME/$BBS_BIOC_VERSION/report.css"
export BBS_REPORT_BGIMG="$BBS_HOME/images/DEVEL3b.png"
export BBS_REPORT_JS="$BBS_HOME/$BBS_BIOC_VERSION/report.js"
#export BBS_REPORT_MOTD="Happy new year to all Bioconductor developers!"

# Needed only on the node performing stage9 (BBS-notify.py)

# TODO: when BBS_NOTIFY_NODES is not defined then take all the build nodes
export BBS_NOTIFY_NODES="malbec2"
