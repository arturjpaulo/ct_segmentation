exam_path = "/home/sliceruser/work/master_images/"

exam_list = glob.glob(exam_path + 'id_*/nii_*/ct_seg/')


import boto3
import zipfile
import shutil
import os
import glob
from distutils.dir_util import copy_tree

# aws_access_key_id = ''
# aws_secret_access_key = ''
# aws_session_token = ''

aws_access_key_id = 'ASIAZD7L6DI6KQBN6345'
aws_secret_access_key = 'sYb7EGh8bB0/rrxISMspJ5SJ67L6ETheHfMpC5y6'
aws_session_token = 'IQoJb3JpZ2luX2VjEMn//////////wEaCWV1LXdlc3QtMSJIMEYCIQDtUKfwQ33RJ0R8Yh8YCsZm6JWt9RefkOpCRB0L2u7bNAIhAL3uzfbPIJWwy9RWe5KC1pxfhF4Eo92YNAGDTWj+MdhFKqkDCPL//////////wEQAxoMNjI3MDIzMTU3ODIwIgz5Jxr/dvqiuANA6zQq/QK/piltwp+kWb+fEKRcDckp6UOzmkSn1/N1fn+AoT2B19xOzR4iZjFWS7VnFnsjuLuTKaa/Ra+sX02X78Q2uQRYlH9OfapUNIFljcWbERSXA+rfiV3Jb5Uy1jlUqlzeEKpD+n2ck9hoIypiLRXBisSsh1wwzOBqLV8HAb/X2jMNkytwBHfh9N4gG3YzIlp8+cATDiq9sd8xb7A0dunnDNkkkLUDzUjgoTZs1QF3fcoIrMFrM2omjApQUUnAhiF8BiCzybUHCflbcRTyNy+vDoTSrO99hcF40RzBvef3CReYUbS54ilZ1tDdidsFuicdBpzJQSxdQHbKl/mgV+08tJINVQSTsKjnwMAKYBrHE4aj+qzkMmOp0xvGEpSnxKAPxT4EvuD+CD63RsLJrMpiC5NAulXPo90KCHA0savRKKDR3952lr6jTqQq4dOO3Kl3TBg8DmBPnWcPe9gxt1V9vlLJmoUfXArM/UDMBBCGPYvGaXvleyVkD2r3h+TXeVswj8ChlgY6pQHME+7JYHibMTiAKoUboOrkVongmxV2EXQQdcW21W3f060uEv5k5YUWVPUgKsaYpovg4eFvV6FwgTEs00JzXnqpr3zziT7taklUNw0MLj8dC5pzSiME+Q5wqKtOTQMkgWesbvmGPlnvSb/35H0rMRZej6mI4EFj4mP0gbISXmqxcX78vAmUeDyDMeWgFK34aCCbZwz2c1YsIuTpgmPrBmmx8PyonNY='


s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id,
                  aws_secret_access_key=aws_secret_access_key,
                  aws_session_token=aws_session_token)
                  
                  

bucket_name = 'validacao-retrospectiva-neuro-new'

for exam in sorted(exam_list)[1:]:
    
    try:
        
        folder_name = exam[:-1]
        splited_path = exam.split("/")
        series_name = splited_path[6]
        id_name = splited_path[5]
        
        print("Running ", id_name)
        
        folder_from = folder_name
        folder_to = os.path.join(os.path.dirname(folder_name), id_name, series_name)
        
        copy_tree(folder_from, folder_to)
         
        shutil.make_archive(os.path.dirname(folder_to), 'zip', os.path.dirname(folder_to))
        
        # Filename - File to upload
        # Bucket - Bucket to upload to (the top level directory under AWS S3)
        # Key - S3 object name (can contain subdirectories). If not specified then file_name is used
        # s3.meta.client.upload_file(Filename='input_file_path', Bucket='bucket_name', Key='s3_output_key')
        s3.upload_file(os.path.dirname(folder_to) + '.zip', bucket_name, 'segmented_masks_artur/' + id_name + '.zip')
        
        shutil.rmtree(os.path.dirname(folder_to))
        os.remove(os.path.dirname(folder_to) + '.zip')
        
        print("Done")
        print()
#         print(os.path.dirname(folder_to))
        
    except:
        pass
