#!/bin/bash
set -x

GPUID="${1:-"6"}"

IHOME=/home/brettin/Singularity
IMPROVE_DATA_DIR=/home/brettin/improve_data_dir

CONTAINER="IGTD-IGTD:0.0.1-20221209"
MODEL_FILE="Default_Params.txt"

singularity exec --nv --bind $IMPROVE_DATA_DIR:/candle_data_dir $IHOME/sandboxes/${CONTAINER}/ train.sh $GPUID /candle_data_dir
singularity exec --nv --bind $IMPROVE_DATA_DIR:/candle_data_dir $IHOME/sandboxes/${CONTAINER}/ train.sh $GPUID /candle_data_dir ${MODEL_FILE}
singularity exec --nv --bind $IMPROVE_DATA_DIR:/candle_data_dir $IHOME/sandboxes/${CONTAINER}/ train.sh $GPUID /candle_data_dir --config_file ${MODEL_FILE}
singularity exec --nv --bind $IMPROVE_DATA_DIR:/candle_data_dir $IHOME/sandboxes/${CONTAINER}/ train.sh $GPUID /candle_data_dir ${MODEL_FILE} --experiment_id EXP001 --run_id RUN001
