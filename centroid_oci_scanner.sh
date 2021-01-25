#/bin/bash
## Provide tenancy name as input
##download the python script from Oracle's official sdk
##
echo "Please provide tenancy name to run this script.."
read -p 'tenancy_name: ' tenancy_name

if [ -z "$tenancy_name" ] 
then 
    echo 'Inputs cannot be blank please try again!' 
    exit 0
fi 

NOW=$(date +"%m-%d-%Y_%H:%M")
###
cd /tmp
git clone https://github.com/oracle/oci-python-sdk.git
##
## Run the showoci.py 
###
echo "---------------------------------------------------"
echo "Running the inventory script, it may take few mins, please do not cancel...."
echo $tenancy_name
##oci iam tenancy get --tenancy-id $OCI_TENANCY
cd /tmp/oci-python-sdk/examples/showoci
python3 showoci.py -dt -a -csv "$tenancy_name" > /tmp/"$tenancy_name"_"$NOW"_showoci.out
##zip the files

echo "---------------------------------------------------"
echo "Uploading files to Centroid...."
sleep 5
echo " "
zip "$tenancy_name"_"$NOW".zip *.csv
curl https://objectstorage.us-ashburn-1.oraclecloud.com/p/Cqf1vXLvH5qi1tklP6Q58BXD4o1NBnhs3LAdUbMNcuTBN-EeL5dyHDWuFcr7yl7_/n/id3nodyt06el/b/testpublic/o/ --upload-file "$tenancy_name"_"$NOW".zip

curl https://objectstorage.us-ashburn-1.oraclecloud.com/p/Cqf1vXLvH5qi1tklP6Q58BXD4o1NBnhs3LAdUbMNcuTBN-EeL5dyHDWuFcr7yl7_/n/id3nodyt06el/b/testpublic/o/ --upload-file /tmp/"$tenancy_name"_"$NOW"_showoci.out

echo "---------------------------------------------------"
echo "Upload complete........"
##clear up files
rm -rf /tmp/oci-python-sdk*
rm -rf /tmp/"$tenancy_name"_"$NOW"_showoci.out

