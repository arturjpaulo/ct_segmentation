#!/bin/bash

#Enter the subject list for looping 



cat subjectList| while read i
do
cd ${i}
    echo Running ${i}...;
    cd nii*
    mkdir ct_seg
    cp master_image.nii.gz master_image.nii

    docker run --rm -it -v dir_host:/data ubuntu:ctseg eval "spm_CTseg('master_image.nii',ct_seg',true,true,true,true,1,2,0.0005)"

  echo segmentation done, transforming to nii.gz ...

  #transforming to nii.gz
  cp c01_1_00001_temp_master_image_CTseg.nii c01_1_00001_temp_master_image_CTseg.nii.gz
  cp c02_1_00001_temp_master_image_CTseg.nii c02_1_00001_temp_master_image_CTseg.nii.gz
  cp c03_1_00001_temp_master_image_CTseg.nii 03_1_00001_temp_master_image_CTseg.nii.gz
  cp c04_1_00001_temp_master_image_CTseg.nii c04_1_00001_temp_master_image_CTseg.nii.gz
  cp c05_1_00001_temp_master_image_CTseg.nii c05_1_00001_temp_master_image_CTseg.nii.gz
  cp c06_1_00001_temp_master_image_CTseg.nii c06_1_00001_temp_master_image_CTseg.nii.gz
  cp mwc01_1_00001_temp_master_image_CTseg.nii mwc01_1_00001_temp_master_image_CTseg.nii.gz
  cp mwc02_1_00001_temp_master_image_CTseg.nii mwc02_1_00001_temp_master_image_CTseg.nii.gz
  cp mwc03_1_00001_temp_master_image_CTseg.nii mwc03_1_00001_temp_master_image_CTseg.nii.gz
  cp mwc04_1_00001_temp_master_image_CTseg.nii mwc04_1_00001_temp_master_image_CTseg.nii.gz
  cp mwc06_1_00001_temp_master_image_CTseg.nii mwc05_1_00001_temp_master_image_CTseg.nii.gz
  cp mwc05_1_00001_temp_master_image_CTseg.nii mwc06_1_00001_temp_master_image_CTseg.nii.gz
  cp ss_master_image.nii ss_master_image.nii.gz
  cp wc01_1_00001_temp_master_image_CTseg.nii wc01_1_00001_temp_master_image_CTseg.nii.gz
  cp wc02_1_00001_temp_master_image_CTseg.nii wc02_1_00001_temp_master_image_CTseg.nii.gz
  cp wc03_1_00001_temp_master_image_CTseg.nii wc03_1_00001_temp_master_image_CTseg.nii.gz
  cp wc04_1_00001_temp_master_image_CTseg.nii wc04_1_00001_temp_master_image_CTseg.nii.gz
  cp wc05_1_00001_temp_master_image_CTseg.nii wc05_1_00001_temp_master_image_CTseg.nii.gz
  cp wc06_1_00001_temp_master_image_CTseg.nii wc06_1_00001_temp_master_image_CTseg.nii.gz
  cp y_1_00001_temp_master_image_CTseg.nii y_1_00001_temp_master_image_CTseg.nii.gz


  echo compactation complete, removing .nii files ...
  rm c05_1_00001_temp_master_image_CTseg.nii
  rm c01_1_00001_temp_master_image_CTseg.nii
  rm c02_1_00001_temp_master_image_CTseg.nii
  rm c03_1_00001_temp_master_image_CTseg.nii
  rm c04_1_00001_temp_master_image_CTseg.nii
  rm c06_1_00001_temp_master_image_CTseg.nii
  rm mwc01_1_00001_temp_master_image_CTseg.nii
  rm mwc02_1_00001_temp_master_image_CTseg.nii
  rm mwc03_1_00001_temp_master_image_CTseg.nii
  rm mwc04_1_00001_temp_master_image_CTseg.nii
  rm mwc05_1_00001_temp_master_image_CTseg.nii
  rm mwc06_1_00001_temp_master_image_CTseg.nii
  rm ss_master_image.nii
  rm wc01_1_00001_temp_master_image_CTseg.nii
  rm wc02_1_00001_temp_master_image_CTseg.nii
  rm wc03_1_00001_temp_master_image_CTseg.nii
  rm wc04_1_00001_temp_master_image_CTseg.nii
  rm wc05_1_00001_temp_master_image_CTseg.nii
  rm wc06_1_00001_temp_master_image_CTseg.nii
  rm y_1_00001_temp_master_image_CTseg.nii

  # change directory to subjetcs folder 
  cd..
cd..






 done