#!/bin/sh
#~./bashrc

#################################################
# check function				#
#################################################
check_exit_val()
{
	if [[ $? -eq 0 ]]
	then
	        echo "True"
	else
	        echo "False"
	fi
}

#################################################
#################################################
# MAIN PROGRAM					#
#################################################
#################################################

echo
echo "Testing function calls to e4s-info-why."
echo

LASTVALID=-1
cat e4s-info-why.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((LASTVALID=LASTVALID+1))
        fi
done

########## TRUE TESTS ##########

echo "Tests that should return True: "

e4s-info-why > /dev/null 2>&1
echo -e "\tNo options: "$(check_exit_val)

e4s-info-why -0 > /dev/null 2>&1
echo -e "\t-0 (first index): "$(check_exit_val)

e4s-info-why -4 > /dev/null 2>&1
echo -e "\t-4 (middle-ish index): "$(check_exit_val)

e4s-info-why -$LASTVALID > /dev/null 2>&1
echo -e "\t-$LASTVALID (last index): "$(check_exit_val)

e4s-info-why --help > /dev/null 2>&1
echo -e "\t--help: "$(check_exit_val)

echo
########## FALSE TESTS ##########

echo "Tests that should return False: "

FIRSTINVALID=$(($LASTVALID+1))

e4s-info-why 0 > /dev/null 2>&1
echo -e "\t0: "$(check_exit_val)

e4s-info-why -a > /dev/null 2>&1
echo -e "\t-a: "$(check_exit_val)

e4s-info-why -- > /dev/null 2>&1
echo -e "\t--: "$(check_exit_val)

e4s-info-why -999999 > /dev/null 2>&1
echo -e "\t-999999: "$(check_exit_val)

e4s-info-why -$FIRSTINVALID > /dev/null 2>&1
echo -e "\t-$FIRSTINVALID: "$(check_exit_val)

e4s-info-why -help > /dev/null 2>&1
echo -e "\t-help: "$(check_exit_val)

e4s-info-why -h > /dev/null 2>&1
echo -e "\t-h: "$(check_exit_val)

echo

}
