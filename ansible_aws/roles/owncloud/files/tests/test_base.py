import yaml
import os
import pytest
import re

DIR_PATH = os.getcwd()
DEFAULT_VAR_PATH = DIR_PATH + "/ansible_aws/vars/owncloud.yml"

with open(DEFAULT_VAR_PATH) as parameters_file:
    parameters_content = yaml.load(parameters_file)

# Instalacao dos pacotes
packages_to_test = parameters_content['packages']

def test_installed_packages(host):
    for package in packages_to_test:
        assert host.package(package).is_installed


# Instalacao dos pacotes python
pip_packages_to_test = parameters_content['pip']

def test_installed_python_packages(host):
    python_packages = host.pip_package.get_packages()
    for pip_package in pip_packages_to_test:
        assert pip_package in python_packages
