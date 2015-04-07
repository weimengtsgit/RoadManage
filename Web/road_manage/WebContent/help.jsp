


在customSelect2.js 中定义select2 的 格式化方法

列表中 多选提交操作时，后台获取选中的值集合的name=ids

 
 列表 ----枚举  (枚举名称：'deviceStatus')
			{ uxEnum:'deviceStatus',uxFastSet:true}
			
	 ---- 扩展操作按钮  {name:"审核",uri:'edit',dataHandler:'INLINE',iclass:'fa fa-info info',dataForm=true}


设置枚举值样式  <span class='label label-sm label-success'>运行正常</span> primary info default warning danger

查询条件
/**
	 * 比较类型
	 */
	public enum MatchType
	{
		EQ, // =
		LIKE, // like
		LT, // <
		LE, // <=
		GT, // >
		GE, // >=
		IN, // in
		NOTLIKE,
		NOTEQ,
		NOTIN;
	}

	/**
	 * 字段类型
	 */
	public enum FiledType
	{
		S(String.class), //字符串
		I(Integer.class), //整形
		L(Long.class), //长整形
		N(Double.class), //双精度
		D(Date.class), //时间
		B(Boolean.class),//布尔
		T(Byte.class);//byte

	}




