# OwnCloud Installation and Configuration
----------------------
*With Docker*:

- `git clone https://github.com/paulosrjr/owncloud_installation.git`
- Change `.env.sample` with your data, and move sample to `.env`
- Execute `run` (./run)
- Follow the instructions with `./run help`

----------------------
*Standalone*:
```
git clone https://github.com/paulosrjr/owncloud_installation.git
cd ansible_aws
```
-> Execute:
```
export AWS_ACCESS_KEY="PUT_YOU_KEY"
export AWS_SECRET_ACCESS_KEY="PUT_YOU_KEY"
export ANSIBLE_HOST_KEY_CHECKING="False"
```
-> To create infra:
```
ansible-playbook aws_create.yml
```
-> To remove infra:
```
ansible-playbook aws_remove.yml
```
-> To install and configure OwnCloud:
```
ansible-playbook owncloud.yml
```
-> To create infra and install and configure OwnCloud:
```
ansible-playbook aws_create.yml && ansible-playbook owncloud.yml
```
----------------------
Considerations:

- If you need disable the auto-configuration in OwnCloud, change `owncloud_first_configuration` with `false` in `owncloud.yml` playbook file.
- Mysql and OwnCloud default parameters and access:
```
MYSQL_ROOT_PASSWORD: mypasswordtest
MYSQL_DATABASE: owncloud
MYSQL_USER: owncloud
MYSQL_PASSWORD: mypasswordtest
OWNCLOUD_ADMIN: admin
OWNCLOUD_PASSWORD: mypasswordtest
```
- Default URL is http://{{MyOwnCloudIP}}:8080  (You can see IP in execution output or in AWS console) 

