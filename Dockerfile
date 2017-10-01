FROM fedora:26

WORKDIR /app

COPY . /app

COPY entrypoint.sh /

RUN dnf install -y ansible python

RUN pip install -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
