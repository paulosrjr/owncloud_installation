# -*- coding: utf-8 -*-
import os
import subprocess
import time
from flask import Flask

app = Flask(__name__)


@app.route('/')
def main_page():
    return render_template('main.html')


@app.route('/ansible_aws')
def ansible_aws():
    output = execute('./script')
    return render_template('template_name.html', output=output)


@app.route('/ansible_azure')
def ansible_azure():
    output = execute('./script')
    return render_template('template_name.html', output=output)


@app.route('/docker_machine')
def docker_machine():
    output = execute('./script')
    return render_template('template_name.html', output=output)


@app.route('/cloudformation')
def cloudformation():
    output = execute('./script')
    return render_template('template_name.html', output=output)



if __name__ == '__main__':
    port = int(os.environ.get("PORT", 8080))
    app.run('0.0.0.0', port=port)
