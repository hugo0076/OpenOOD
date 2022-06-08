#!/bin/bash
# sh scripts/ood/mls/imagenet_test_ood_maxlogit.sh

GPU=1
CPU=1
node=73
jobname=openood

PYTHONPATH='.':$PYTHONPATH \
srun -p mediasuper -x SZ-IDC1-10-112-2-17 --gres=gpu:${GPU} \
--cpus-per-task=${CPU} --ntasks-per-node=${GPU} \
--kill-on-bad-exit=1 --job-name=${jobname} \
python main.py \
--config configs/datasets/imagenet/imagenet.yml \
configs/datasets/imagenet/imagenet_ood.yml \
configs/networks/vit.yml \
configs/pipelines/test/test_ood.yml \
configs/postprocessors/maxlogit.yml \
--num_workers 8 \
--mark 0
