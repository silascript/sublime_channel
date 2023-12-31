
# 下载及更新插件列表json


# 读取地址列表
function addrs_reader(){
	
	addrsls_file_path=$1

	# 判断文件是否存在
	if [[ ! -f $addrsls_file_path ]];then
		echo -e "\e[93m$addrsls_file_path \e[96m文件不存在！\e[0m"	
		return
	fi
	
	# 地址数组
	# 由外部定义当参数传进来
	# 用来将从文件读取的数据传到函数外部
	addrs_arr=$2

	# 读取文件
	# 去除空行及以 # 起头的行
	for line in `cat $addrsls_file_path | grep -v ^$ | grep -v ^\#` 
	do
		# 将数据存放到数组
		addrs_arr+=("$line")
		# echo $line
		
	done

	# cat $addrsls_file_path | grep -v ^$ | grep -v ^\# | while read line
	# do
		# # echo $line
		# # 将数据存放到数组
		# addrs_arr+=("$line")
		# 
	# done


	# echo ${#addrs_arr[@]}

}

# 下载
function download_file(){

	# 地址数组
	ad_arry=$1
	
	# echo ${#ad_arry[@]}
	# echo ${#ad_arry[*]}
	# echo ${ad_arry[0]}

	if [[ ${#ad_arry[@]} -eq 0 ]];then
		echo -e "\e[93m没有获取到任何下载地址... \n \e[0m"	
		return
	fi


	for arr_temp in ${addrs_arr[*]}
	do
		# 使用wget下载
		# 如果同名文件存在就直接覆盖
		# 文件名取 最后一个 / 后的文件名
		wget -O  "${arr_temp##*\/}" $arr_temp
	done

}



# ---------------------------- 测试 ---------------------------- #

# --------------------------------------------------- #

#  测试读取地址列表文件
# f_path="addrs_list.txt"
# 用来存放数据的数组
# ads_arr=()
# addrs_reader $f_path $ads_arr
# 遍历数组
# for arr_temp in ${addrs_arr[*]}
# do
	# echo $arr_temp
# done

# --------------------------------------------------- #

# 测试下载

# 用来存放数据的数组
f_path="addrs_list.txt"
ads_arr=('')
# ads_arr=""
# 读取地址文件
addrs_reader $f_path $ads_arr
# 下载
download_file $ads_arr



