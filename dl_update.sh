

# -------------------------引入脚本------------------------- #

source ./dl_update_func.sh

# -------------------------变量声明------------------------- #

# 地址文件路径
ads_path="addrs_list.txt"

# -------------------------函数------------------------- #

# 下载
function dl(){

	# 地址文件路径
	local f_path=$1

	# 读取地址文件
	local ads_arr=($(addrs_reader $f_path))

	# echo ${#ads_arr[*]}
	# echo ${ads_arr[0]}
	# echo ${ads_arr[1]}

	# 下载
	download_by_array ${ads_arr[*]}

}


# -------------------------执行------------------------- #

# 执行下载
dl $ads_path



