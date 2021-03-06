#!/bin/bash
#
#    Copyright 2015 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

set -ex

VENV=${WORKSPACE}_VENV
virtualenv -p python2.6 --clear ${VENV}
source ${VENV}/bin/activate || exit 1

pip install "tox>=1.8"
pip install -r ${WORKSPACE}/utils/jenkins/tasks-test-requirements.txt

/bin/bash ${WORKSPACE}/utils/jenkins/tasks_run_tests.sh
