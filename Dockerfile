FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel
# install Python 3.7.10
RUN conda create --name testing_env -c anaconda python=3.7.10
# mount the current directory inside container
ADD . /MXMNet
WORKDIR /MXMNet
# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "testing_env", "/bin/bash", "-c"]
RUN pip install -U pip
RUN pip install -r requirements.txt
RUN pip install tqdm

# output the python version installed
RUN python --version
# output the packages installed in the virtual environment
RUN pip freeze
# show CUDA version
RUN nvcc --version

# entrypoint the same as 4 commands above; that is: check python version, check packages installed, check CUDA version, check GPU usage
# and run python and check if cuda is available in torch
ENTRYPOINT python --version && pip freeze && nvcc --version && python -c "import torch; print('CUDA available: ', torch.cuda.is_available())"