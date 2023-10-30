#!/bin/bash
sub_7T="sub13"
sub_3T="sub-MRS22"


sct_crop_image -i 7T/$sub_7T/M0/palier1/t1_mp2r_uni_aniso_or_RPI.nii.gz -m 7T/$sub_7T/M0/palier1/t1q_aniso_or_cor_den_sc_RPI.nii.gz -o "pal1_reg_3T_7T/"$sub_7T"_7T.nii.gz"  -dilate 15x15x0
sct_crop_image -i 7T/$sub_7T/M0/palier1/t1q_aniso_or_cor_den_sc_RPI.nii.gz -m 7T/$sub_7T/M0/palier1/t1q_aniso_or_cor_den_sc_RPI.nii.gz -o "pal1_reg_3T_7T/"$sub_7T"_7T_sc.nii.gz"  -dilate 15x15x0

sct_crop_image -i lesions_qc/marseille-3T-mp2rage/$sub_3T/ses-M0/anat/$sub_3T"_ses-M0_UNIT1.nii.gz" -m lesions_qc/marseille-3T-mp2rage/derivatives/labels/$sub_3T/ses-M0/anat/$sub_3T"_ses-M0_UNIT1_label-SC_seg.nii.gz" -o "pal1_reg_3T_7T/"$sub_7T"_3T.nii.gz"  -dilate 5x5x0
sct_crop_image -i "lesions_qc/marseille-3T-mp2rage/derivatives/labels/"$sub_3T"/ses-M0/anat/"$sub_3T"_ses-M0_UNIT1_label-SC_seg.nii.gz" -m "lesions_qc/marseille-3T-mp2rage/derivatives/labels/"$sub_3T"/ses-M0/anat/"$sub_3T"_ses-M0_UNIT1_label-SC_seg.nii.gz" -o "pal1_reg_3T_7T/"$sub_7T"_3T_sc.nii.gz"  -dilate 5x5x0

sct_maths -i "pal1_reg_3T_7T/"$sub_7T"_7T_sc.nii.gz" -dim 2 -shape disk  -dilate 3 -o "pal1_reg_3T_7T/"$sub_7T"_7T_sc_dil.nii.gz" 
sct_maths -i "pal1_reg_3T_7T/"$sub_7T"_3T_sc.nii.gz" -dim 2 -shape disk  -dilate 1 -o "pal1_reg_3T_7T/"$sub_7T"_3T_sc_dil.nii.gz"
sct_maths -i "pal1_reg_3T_7T/"$sub_7T"_7T_sc.nii.gz" -dim 2 -shape disk  -dilate 4 -o "pal1_reg_3T_7T/"$sub_7T"_7T_sc_dil4.nii.gz"




