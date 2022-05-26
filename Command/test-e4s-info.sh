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
echo "Testing function calls to e4s-info."
echo

########## TRUE TESTS ##########

echo "Tests that should return True: "

# Empty Arguments

e4s-info > /dev/null 2>&1
echo -e "\te4s-info: "$(check_exit_val)

# One Argument

e4s-info why > /dev/null 2>&1
echo -e "\te4s-info why: "$(check_exit_val)

e4s-info who > /dev/null 2>&1
echo -e "\te4s-info who: "$(check_exit_val)

e4s-info what > /dev/null 2>&1
echo -e "\te4s-info what: "$(check_exit_val)

e4s-info where > /dev/null 2>&1
echo -e "\te4s-info where: "$(check_exit_val)

e4s-info how > /dev/null 2>&1
echo -e "\te4s-info how: "$(check_exit_val)

# Two Arguments

e4s-info how -0 > /dev/null 2>&1
echo -e "\te4s-info how -0: "$(check_exit_val)

e4s-info where -1 > /dev/null 2>&1
echo -e "\te4s-info where -1: "$(check_exit_val)

LASTVALID=-1
cat e4s-info-why.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((LASTVALID=LASTVALID+1))
        fi
done
e4s-info why -$LASTVALID > /dev/null 2>&1
echo -e "\te4s-info why -$LASTVALID (last index): "$(check_exit_val)
}

LASTVALID=-1
cat e4s-info-what.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((LASTVALID=LASTVALID+1))
        fi
done
e4s-info what -$LASTVALID > /dev/null 2>&1
echo -e "\te4s-info what -$LASTVALID (last index): "$(check_exit_val)
}

LASTVALID=-1
cat e4s-info-who.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((LASTVALID=LASTVALID+1))
        fi
done
e4s-info who -$LASTVALID > /dev/null 2>&1
echo -e "\te4s-info who -$LASTVALID (last index): "$(check_exit_val)
}
# Help

e4s-info --help > /dev/null 2>&1
echo -e "\te4s-info --help: "$(check_exit_val)

echo
########## FALSE TESTS ##########

echo "Tests that should return False: "

echo

e4s-info -0 > /dev/null 2>&1
echo -e "\te4s-info -0: "$(check_exit_val)

e4s-info why -a > /dev/null 2>&1
echo -e "\te4s-info why -a: "$(check_exit_val)

e4s-info who -- > /dev/null 2>&1
echo -e "\te4s-info who --: "$(check_exit_val)

e4s-info what -999999 > /dev/null 2>&1
echo -e "\te4s-info what -999999: "$(check_exit_val)

FIRSTINVALID=0
cat e4s-info-why.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((FIRSTINVALID=FIRSTINVALID+1))
        fi
done
e4s-info why -$FIRSTINVALID > /dev/null 2>&1
echo -e "\te4s-info why -$FIRSTINVALID (first invalid index): "$(check_exit_val)
}

FIRSTINVALID=0
cat e4s-info-who.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((FIRSTINVALID=FIRSTINVALID+1))
        fi
done
e4s-info who -$FIRSTINVALID > /dev/null 2>&1
echo -e "\te4s-info who -$FIRSTINVALID (first invalid index): "$(check_exit_val)
}

FIRSTINVALID=0
cat e4s-info-where.data | {
while IFS= read -r LINE
do
        if [[ ${LINE:0:1} = "%" ]]
        then
                ((FIRSTINVALID=FIRSTINVALID+1))
        fi
done
e4s-info where -$FIRSTINVALID > /dev/null 2>&1
echo -e "\te4s-info where -$FIRSTINVALID (first invalid index): "$(check_exit_val)
}

e4s-info-why -help > /dev/null 2>&1
echo -e "\t-help: "$(check_exit_val)

e4s-info-why -h > /dev/null 2>&1
echo -e "\t-h: "$(check_exit_val)

echo


