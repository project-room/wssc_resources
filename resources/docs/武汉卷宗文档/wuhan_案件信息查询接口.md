## 1.卷宗目录结构及文件

### 请求方式：get

### 请求地址：```/zccaseInfo/queryByParam```

### 请求类型：

### 参数说明: 

	|参数|值|必须|说明|
	|:--|:--|:--|:--|
	|case_code|String|否|案件编码|
	|case_name|String|否|案号|



### 请求示例：

	http://192.168.0.21:8088/court/zccaseInfo/queryByParam?case_name=（2017）冀行终288号&case_code=1234


### 返回结果

	```json
	{
	  "code": "0",
	  "message": "Success",
	  "total": 1,
	  "data": [
	    {
	      "case_id": "1000005489993908",
	      "case_code": "1234",
	      "court_id": 100,
	      "case_type_id": 18,
	      "case_name": "（2017）冀行终288号",
	      "case_status": 10,
	      "upload_user_id": null,
	      "deal_user_id": null,
	      "create_time": 1512581359069,
	      "display": 0,
	      "spcx_id": 30302,
	      "case_ext_id": "EB228D0301EE25A2034306753CF42C79",
	      "cbr_name": "张岩",
	      "cbr_id": 6554052,
	      "index_str": "288",
	      "court_room_id": 6553612,
	      "lock_flag": 0,
	      "la_date": "2017-07-20",
	      "ja_date": "2017-09-06",
	      "yla_flag": 0,
	      "cur_deal_user_id": null,
	      "book_status": null
	    }
	  ]
	}



### 结果说明

	|参数|说明|
	|:--|:--|
	|code|返回码|
	|message|说明|
	|data|数据列表|
	|case_id|案件ID|
	|case_code|案件编号|
	|court_id|法院ID|
	|case_type_id|案件类型|
	|case_name|案件名称|
	|case_status|案件状态|
	|upload_user_id|上传人ID|
	|deal_user_id|处理人ID|
	|create_time|创建时间戳|
	|display|案件可用状态|
	|spcx_id|审判程序ID|

###返回码说明

	|返回码|说明|
	|:--|:--|
	|0|成功|
