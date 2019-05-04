for ri in {1..1}

do  

jobid=$ri
jobname="b_1300000_500_"
echo '#!/bin/bash'>subjob.bash
echo '#PBS -q celltypes'>>subjob.bash
echo '#PBS -N some_name'>>subjob.bash
echo '#PBS -m a'>>subjob.bash
echo '#PBS -r n'>>subjob.bash
echo '#PBS -l nodes=1:ppn=16'>>subjob.bash
echo '#PBS -l mem=16g,walltime=150:00:00'>>subjob.bash
echo '#PBS -o /allen/programs/celltypes/workgroups/rnaseqanalysis/Fahimehb/patchseq-work-dir/Patchseq_vs_FACs_cre_analysis/mouse_patchseq_VISp_20181220_collapsed40_cpm/logs/'${jobname}${jobid//./-}'.out'>>subjob.bash
echo '#PBS -j oe'>>subjob.bash
echo 'source activate mypython3'>>subjob.bash
echo 'cd /allen/programs/celltypes/workgroups/rnaseqanalysis/Fahimehb/patchseq-work-dir/Patchseq_vs_FACs_cre_analysis/mouse_patchseq_VISp_20181220_collapsed40_cpm'>>subjob.bash
echo 'python -m Keras_balanced_trainer --batch_size 500 --epochs 1300000 --exp_name Keras_models/testing_balance_method --model_id b_1300000_500 --run_iter '$ri>>subjob.bash
echo '...'

sleep 1

wait

qsub subjob.bash

echo 'Job: '$jobid' '

done


rm subjob.bash
