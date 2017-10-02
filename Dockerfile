FROM fedora:26

WORKDIR /owncloud

COPY . /owncloud

COPY entrypoint.sh /

COPY ansible.cfg /etc/ansible/ansible.cfg

RUN dnf install -y ansible python

RUN pip install -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
