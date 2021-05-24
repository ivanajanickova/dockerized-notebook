FROM ubuntu:latest

RUN mkdir src
WORKDIR src/
COPY  . .

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y libzmq3-dev python3-pip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install --upgrade pip
RUN pip3 install -U jupyter jupyterlab
RUN jupyter serverextension enable --py jupyterlab --sys-prefix
RUN python3 -m pip install -r requirements.txt

EXPOSE 8888

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
