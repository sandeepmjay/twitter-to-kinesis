#!/bin/bash

export AWS_DEFAULT_REGION="eu-west-1"
export PYTHONPATH=/opt/twitter-to-kinesis
export PATH=/home/ec2-user/miniconda/bin:$PATH

# create or update conda env
conda env update -n twitter-to-kinesis -f /opt/twitter-to-kinesis/conda-dev-env.yml
source activate twitter-to-kinesis

cd /opt/twitter-to-kinesis/

# start producer
python /opt/twitter-to-kinesis/sender_daemon.py --pid_file /tmp/twitter_sender.pid start &>/dev/null &
