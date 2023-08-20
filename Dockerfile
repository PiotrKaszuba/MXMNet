FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime
# install Python 3.7.10
RUN conda create --name testing_env -c anaconda python=3.7.10
# mount the current directory inside container
ADD . ~/MXMNet
WORKDIR ~/MXMNet
RUN conda activate testing_env
RUN pip install -r requirements.txt
RUN pip install tqdm




# output the python version installed
RUN python --version
# output the packages installed in the virtual environment
RUN pip freeze
# show CUDA version
RUN nvcc --version
# show GPU usage
RUN nvidia-smi

# entrypoint the same as 4 commands above; that is: check python version, check packages installed, check CUDA version, check GPU usage
ENTRYPOINT python --version && pip freeze && nvcc --version && nvidia-smi