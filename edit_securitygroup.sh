#/bin/bash
# ==============================
# Usage
# 指定VPCにセキュリティグループ 作成
#  引数にaws configureでつけたprofile名を記載して実行
# 例：
#  ./add-mackerel.sh ${PROFILE} ${GROUP_ID}
#===============================

profile=$1
GROUP_ID=$2
list="ip.list"


for IP in `cat ${list}`
do
	echo "add ${IP}"
	aws ec2 authorize-security-group-ingress --profile ${profile} --group-id ${GROUP_ID} --protocol tcp --port 80 --cidr ${IP}
done

exit 0


