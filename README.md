# centroid_oci_scanner
This is centroid OCI Inventory generation script. This is a reporting tool which uses the Python SDK to extract list of resources from your tenant and upload the output of Centroid managed object store. For additional questions please reach out to:
navdeep.saini@centroid.com

## Prerequisites
This script works best in OCI cloud shell. Please see here for more details on how to use cloud shell
[Oracle Cloud Shell](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/devcloudshellgettingstarted.htm#Using_Cloud_Shell)

## Instructions
Once you are in the OCI Cloud shell, you can easily download and run the script using git clone:

```
git clone https://github.com/revnav/centroid_oci_scanner.git
```
Provide executable permission on the script and run the script

```
chmod +x centroid_oci_scanner.sh
./centroid_oci_scanner.sh

```
Once the script finishes it uploads the outout automatically to Centroid managed object store. You will see  message like the below in your shell:

```
---------------------------------------------------
Upload complete........

```
