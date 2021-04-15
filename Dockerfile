FROM ubuntu:18.04

RUN apt update; apt install -y wget \
                               curl \
                               git \
                               vim \
                               g++


RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

RUN bash Anaconda3-2020.07-Linux-x86_64.sh -b

RUN bash -c "source /root/anaconda3/bin/activate;\
             conda init;\
             conda config --set restore_free_channel True;\
             conda create -n env_python3.6 python=3.6 anaconda;\
             source activate env_python3.6;\
             conda install -c conda-forge pyspark;\
             python3.6 -m pip install -U pip;\
             python3.6 -m pip install  jupyterlab;"\


EXPOSE 8888    

ENTRYPOINT ["jupyter", "notebook", "--no-browser","--ip=0.0.0.0","--NotebookApp.token=''","--NotebookApp.password=''"]






