#!/usr/bin/env bash

#SBATCH -e /nfs/log/%A-%a.err
#SBATCH -o /nfs/log/%A-%a.out

#SBATCH --mail-user koppi
#SBATCH --mail-type ALL

SCENE=${1}
FRAMES=${2}

POVARGS="+W1280 +H720 +A0.3 -J"

if [ -z "${SCENE}" ]; then
  echo "SCENE is unset or set to the empty string"
  exit 1
fi

WORKDIR=`pwd`
FRAME=$SLURM_ARRAY_TASK_ID

mkdir -p $WORKDIR
cd $WORKDIR

echo "$SLURMD_NODENAME:$WORKDIR"
echo

PNG="$SCENE-$(printf "%05d" $FRAME).png"

povray /nfs/bpp/export/$SCENE/$SCENE.ini +L. +Lincludes +L/nfs/bpp/includes +L/nfs/bpp/export/$SCENE -V -D +KFI0 +KFF$FRAMES +SF$FRAME +EF$FRAME $POVARGS -O- > $WORKDIR/$PNG
