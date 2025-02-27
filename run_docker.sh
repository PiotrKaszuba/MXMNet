mkdir outputs
docker build . -t mxmnet:v1.0
docker run mxmnet:v1.0 python --version
docker run mxmnet:v1.0 pip freeze
docker run mxmnet:v1.0 nvcc --version
docker run mxmnet:v1.0 python -c "import torch; print(torch.cuda.is_available())"
docker run mxmnet:v1.0 -v ./outputs:/MXMNet/outputs python -u main.py --target 2 --cutoff 10 --batch_size 128 --excluded_mols_file data/excludedMolecules_MG.txt > outputs/docker_output.txt