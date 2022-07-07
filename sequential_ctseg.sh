#!/bin/bash

#Enter the subject list for looping 
#cat subjectList| while read i
i=0
# cat subtest| while read i
cat subjectList| while read i
do
    cd ${i}
    echo Running ${i}...;
    
    echo "Testando echo $PWD"
    
    mkdir ${i}/ct_seg
    
    gzip -d master_image.nii.gz
    
    docker run --rm -v ${i}:/data ubuntu:ctseg eval "spm_CTseg('data/master_image.nii','data/ct_seg',true,true,true,true,1,2,0.0005)"
    
    #echo segmentation done, transforming to nii.gz ...
    
    ##transforming to nii.gz
    gzip *.nii*
    gzip ${i}/ct_seg/*.nii*
  
done
