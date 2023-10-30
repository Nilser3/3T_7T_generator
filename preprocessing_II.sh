#!/bin/bash
subjects=(sub00 sub01 sub02 sub03 sub04 sub05 sub06 sub07 sub08 sub09 sub10 sub11 sub12 sub13 sub14 sub15 sub16 sub17 sub18)

mkdir ants_II

for subject in "${subjects[@]}"
do

antsRegistration --verbose 1 --dimensionality 3 --float 0 --collapse-output-transforms 1 --output [ ants/$subject,ants/$subject"_Warped.nii.gz",ants/$subject"_InverseWarped.nii.gz" ] --interpolation Linear --use-histogram-matching 0 --winsorize-image-intensities [ 0.005,0.995 ] --initial-moving-transform [ $subject"_7T.nii.gz",$subject"_3T_roi.nii.gz",1 ] --transform Rigid[ 0.1 ] --metric MI[ $subject"_7T.nii.gz",$subject"_3T_roi.nii.gz",1,32,Regular,0.25 ] --convergence [ 1000x500x250x100,1e-6,10 ] --shrink-factors 8x4x2x1 --smoothing-sigmas 3x2x1x0vox --transform Affine[ 0.1 ] --metric CC[ $subject"_7T.nii.gz",$subject"_3T_roi.nii.gz",0.2,2] --metric CC[$subject"_7T_sc_dil4.nii.gz",$subject"_3T_sc_roi_dil.nii.gz",0.8,2] --convergence [ 1000x500x250x100,1e-6,10 ] --shrink-factors 8x4x2x1 --smoothing-sigmas 3x2x1x0vox

fslmaths ants/$subject"_warped.nii.gz" -mul $subject"_7T_sc_dil.nii.gz" ants_II/$subject"_3T_masked.nii.gz"

fslmaths $subject"_7T.nii.gz" -mul $subject"_7T_sc_dil.nii.gz" ants_II/$subject"_7T_masked.nii.gz"

echo $subject

done
