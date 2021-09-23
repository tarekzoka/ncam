   
#!/bin/sh

# 
# SCRIPT : DOWNLOAD AND INSTALL EMU nacam #
# ======================================================================================
# Command: wget https://raw.githubusercontent.com/tarekzoka/ncam/main/installer.sh -O - | /bin/sh #
# ======================================================================================

# MY CONFIG SCRIPT #
###########################################
PACKAGE_DIR='ncam/main'
MY_IPK="ncam_11.90_all.ipk"
MY_DEB="ncam_11.90_all.deb"


######################################################################################
# Auto ... Do not change
######################################################################################

# Decide : which package ?
MY_MAIN_URL="https://raw.githubusercontent.com/tarekzoka/"
if which dpkg > /dev/null 2>&1; then
	MY_FILE=$MY_DEB
	MY_URL=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_DEB
else
	MY_FILE=$MY_IPK
	MY_URL=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_IPK
fi
MY_TMP_FILE="/tmp/"$MY_FILE

echo ''
echo '************************************************************'
echo '**                         STARTED                        **'
echo '************************************************************'
#            # WRITE Script By 0000               
# AND MODIFY Script To Work  Emu Ncam                                     
             # BY TAREK_TT#
echo "************************************************************"
echo ''

# Remove previous file (if any)
rm -f $MY_TMP_FILE > /dev/null 2>&1

# Download package file
EM='============================================================='
echo $EM
echo 'Downloading '$MY_FILE' ...'
echo $EM
echo ''
wget -T 2 $MY_URL -P "/tmp/"

# Check download
if [ -f $MY_TMP_FILE ]; then
	# Install
	echo ''
	echo $EM
	echo 'Installation started'
	echo $EM
	echo ''
	if which dpkg > /dev/null 2>&1; then
		apt-get install --reinstall $MY_TMP_FILE -y
	else
		opkg install --force-reinstall $MY_TMP_FILE
	fi
	MY_RES=$?

	# Res
	echo ''
	echo ''
	if [ $MY_RES -eq 0 ]; then
echo "*************************************************************************************************************************"
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	echo ''
	echo '**************************************************'
	echo '**                   FINISHED                   **'
	echo '**************************************************'
	echo ''   
   wait 2;   
	exit 0
else
	echo ''
	echo "Download failed !"
	exit 1
fi

# 
