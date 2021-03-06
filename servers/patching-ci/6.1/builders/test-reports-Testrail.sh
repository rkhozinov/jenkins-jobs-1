#!/bin/bash
#
# TestRail

set -ex

export TESTRAIL_USER=${TESTRAIL_USER}
export TESTRAIL_PASSWORD=${TESTRAIL_PASSWORD}
export TESTRAIL_REPORTER_PATH="fuelweb_test/testrail/report.py"

# Prepare venv
source /home/jenkins/qa-venv-6.1/bin/activate

# Report tests results from swarm (Ubuntu)

export USE_UBUNTU=true
export USE_CENTOS=true
python ${TESTRAIL_REPORTER_PATH} -v -l -j ${TESTS_RUNNER} ${OPTIONS}
