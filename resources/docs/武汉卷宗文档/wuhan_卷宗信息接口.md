## 1.卷宗目录结构及文件
### 请求方式：get
### 请求地址：```/files/queryClassifyFiles```
### 请求类型：
### 参数说明: 
	|参数|值|必须|说明|
	|:--|:--|:--|:--|
	|caseId|String|否|案件ID|



### 请求示例：
	http://192.168.0.21:8088/court/files/queryClassifyFiles?caseId=4772841589876


### 返回结果
	```json
	{
	  "code": "0",
	  "message": "Success",
	  "data": {
	    "caseInfoVo": {
	      "case_id": "4772841589876",
	      "case_code": null,
	      "court_id": 100,
	      "case_type_id": 2,
	      "case_name": "(2018)冀民再301",
	      "case_status": null,
	      "upload_user_id": 76,
	      "deal_user_id": null,
	      "create_time": 1526611906950,
	      "display": 0,
	      "spcx_id": 12,
	      "court_room_id": 6553602,
	      "court_name": "河北省高级人民法院"
	    },
	    "subCaseInfoList": [
	      {
	        "case_id": "4772841589876",
	        "sub_case_id": "47728415898761",
	        "case_code": null,
	        "court_id": 100,
	        "case_type_id": 2,
	        "case_name": "(2018)冀民再301"
	        "upload_user_id": 76,
	        "create_time": 1526611906951,
	        "display": 0,
	        "book_status": 0,
	        "spcx_id": 12,
	        "court_room_id": 6553602,
	        "court_room_name": null,
	        "root_directory_id": 698
	      }
	    ],
		"dirList": [
	      {
	        "directory_id": 698,
	        "parent_id": 0,
	        "directory_name": "正卷",
	        "display": 0,
	        "directory_model_id": 8,
	        "directory_index": 0,
	        "directory_type": 0,
	        "children": [
	          {
	            "directory_id": 705,
	            "parent_id": 698,
	            "directory_name": "正卷待分类区",
	            "display": 0,
	            "directory_model_id": 8,
	            "directory_index": 1,
	            "directory_type": 0,
	            "children": [],
	            "index": 1
	          }
			],
	        "index": 0
	      }
		],
		"fileInfos": {
	      "705": {
	        "47728415898761": [
	          {
	            "fileId": "3506979548737732",
	            "fileName": "3506979548737732.jpg",
	            "fileIndex": 1,
	            "caseId": "4772841589876",
	            "subCaseId": "47728415898761",
	            "directoryId": 705,
	            "fileDirectoryIndex": 1,
	            "subIndex": 1,
	            "display": 0,
	            "store_server_id": null,
	            "remote_file_path": null,
	            "file_path": "/home/visionread/data/court_image/2018/05/4772841589876/1/3506979548737732.jpg"
	          }
			]
	      }
	    },
	    "dossierMsg": ""
	  }
	}



### 结果说明
	|参数|说明|
	|:--|:--|
	|code|返回码|
	|message|说明|
	|data|数据列表|
	|caseInfoVo|案件信息|
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
	|court_room_id|庭室ID|
	|subCaseInfoList|案件上传批次列表|
	|case_id|案件ID|
	|sub_case_id|批次ID|
	|case_code|案件编码|
	|court_id|法院ID|
	|root_directory_id|根目录ID|
	|dirList|目录列表|
	|directory_id|目录ID|
	|parent_id|上级目录ID|
	|directory_name|目录名称|
	|directory_model_id|目录模板ID|
	|directory_index|目录排序字段|
	|directory_type|目录类型|
	|children|子目录列表|
	|fileInfos|文件列表|
	|fileId|文件ID|
	|fileName|文件名称|
	|fileDirectoryIndex|文件目录内顺序|
	|fileIndex|文件上传顺序|


###返回码说明
	|返回码|说明|
	|:--|:--|
	|0|成功|


##2.文件下载接口
### 请求方式：get
### 请求地址：```/download/downloadFile```
### 请求类型：
### 参数说明: 
	|参数|值|必须|说明|
	|:--|:--|:--|:--|
	|fileID|String|否|文件ID|



### 请求示例：
	http://192.168.0.21:8088/court/download/downloadFile?fileID=4772841589876




##3.OCR接口 (弃用)
### 请求方式：post
### 请求地址：```/recog/```
### 请求类型：json数组
### 参数说明: 

	{"image":"/9j/4A"}

	|image|参数名|
	|/9j/4A|图片的base64|

### 请求示例：
	http://192.168.0.11:8082/recog/


### 返回结果
	```json
	{
		"code":0,
		"data":{
			"text":"以此推进互联网+商家、互联网+超市等新兴消费模式，刺激消费，拉动内需，活路县域经济。希望县内有关商业企业，结合各自经营实际，支持推广我惠电子商务模式，促进县域经济较快较好发展多六20贤由|"
		},
		"msg":"success"
	}

###结果说明
	|参数|说明|
	|:--|:--|
	|code|返回码|
	|msg|返回信息|
	|data|数据|
	|text|识别全文|


