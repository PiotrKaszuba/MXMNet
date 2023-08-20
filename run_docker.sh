mkdir outputs
docker build . -t MXMNetDocker
docker run MXMNetDocker -v ./outputs:/MXMNet/outputs
python -u main.py --target 2 --cutoff 10 --batch_size 128 --excluded_mols_file data/excludedMolecules_MG.txt > outputs/docker_output.txt