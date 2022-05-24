DEFAULTS='-it --rm --init'

MEMORY='-m 8GB'
GPUS='--gpus all'

IMAGE='wllhf/tensorflow:htcv22a-v4'

# directories need to exist and have your users permissions
VOL_OUT="$HOME/Documents/uni/htcv22a/all_runs/example:/out"
VOL_DAT="/shared/datasets/:/data"
VOL_WOR="$HOME/Documents/uni/htcv22a/src/:/wd"
VOL_TFM="$HOME/Documents/uni/tf-model-garden/:/opt/tfm" # when mounting custom tfm repo add below -v $VOL_TFM

WORKDIR='--workdir /wd'

EXPERIMENT='tf_vision_example_experiment'
CONFIG='/wd/src/configs/experiments/example.yaml'
MODE='train'
OUTPUT_DIR='/out'


docker run \
    --user "$(id -u):$(id -g)" \
    $DEFAULTS $GPUS $MEMORY \
    -v $VOL_OUT -v $VOL_DAT -v $VOL_WOR  -v $VOL_TFM \
    $WORKDIR $IMAGE \
    python3 /opt/tfm/official/vision/beta/projects/example/train.py \
    --experiment=$EXPERIMENT \
    --config_file=$CONFIG \
    --mode=$MODE \
    --model_dir=$OUTPUT_DIR
