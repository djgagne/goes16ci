#!/bin/bash -l
#SBATCH --job-name=goes16ci
#SBATCH --account=NAML0001
#SBATCH --ntasks=32
#SBATCH --time=04:00:00
#SBATCH --partition=dav
#SBATCH --mem=128G
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:v100:1
module load gnu/7.3.0 openmpi python/3.6.8 cuda/10.0
source /glade/work/gwallach/ncar_pylib_dl_10/bin/activate
cd ~/goes16ci
python setup.py install
python -u goes16_deep_learning_benchmark.py -c benchmark_config_default >& goes_deep.log
