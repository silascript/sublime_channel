
# 下载及更新插件列表json


# 读取地址列表
function addrs_reader(){
	
	local addrsls_file_path=$1

	# 判断文件是否存在
	if [[ ! -f $addrsls_file_path ]];then
		echo -e "\e[93m$addrsls_file_path \e[96m文件不存在！\e[0m"	
		return
	fi
	
	# echo -e "\e[96m开始读取 $addrsls_file_path \e[96m文件构建数组... \n \e[0m"	

	# 地址数组
	# local addrs_arr=()
	local addrs_arr

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


	# 返回数组
	echo ${addrs_arr[*]}
	# echo ${addrs_arr[@]}

}

# 通过地址数组批量下载
function download_by_array(){

	# 地址数组
	# 接收外部传来的数组
	local ads_array=($@)
	
	# echo ${#ad_arry[@]}
	# echo ${#ad_arry[*]}
	# echo ${ad_arry[0]}
	# echo ${ad_arry[1]}

	if [ ${#ads_array[*]} -eq 0 ];then
		echo -e "\e[93m没有获取到任何下载地址！请检查地址列表文件！ \n \e[0m"	
		return
	fi

	echo -e "\e[96m开始下载... \n \e[0m"

	# 遍历地址数组取出地址并进行下载
	for arr_temp in ${ads_array[*]}
	do
		# echo $arr_temp

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
# ads_arr=(`addrs_reader $f_path`)
# ads_arr=($(addrs_reader $f_path))

# echo $ads_arr
# echo ${#ads_arr[*]}
# echo ${#ads_arr[@]}

# 遍历数组
# for arr_temp in ${ads_arr[*]}
# do
	# echo $arr_temp
# done

# --------------------------------------------------- #

# 测试下载

# 用来存放数据的数组
# f_path="addrs_list.txt"
# ads_arr=('')
# ads_arr=""
# 读取地址文件
# ads_arr=($(addrs_reader $f_path))

# echo ${#ads_arr[*]}
# echo ${ads_arr[0]}
# echo ${ads_arr[1]}

# 下载
# download_by_array ${ads_arr[*]}


