<#include "../../ui/excel.ftl"/>
<#if packageStyle == "service">
package ${bussiPackage}.${entityPackage}.entity;
<#else>
package ${bussiPackage}.entity.${entityPackage};
</#if>

import java.math.BigDecimal;
import java.util.Date;
import java.lang.String;
import java.util.List;
import java.lang.Double;
import java.lang.Integer;
import java.math.BigDecimal;
import javax.xml.soap.Text;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Transient;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * 功能描述：
 * <p>
 * @author Sean
 * <p>
 * @date ${ftl_create_time}
 * <p>
 * 修改记录：修改内容 修改人 修改时间
 * <ul>
 * <li></li>
 * </ul>
 * <p>
 * Copyright © 2016-2018, 深圳市乐乐网络科技有限公司, All Rights Reserved
 * <p>
 */
@Entity
@Table(name = "${tableName}")
<#if cgformConfig.cgFormHead.jformPkType?if_exists?html == "SEQUENCE">
@SequenceGenerator(name="SEQ_GEN", sequenceName="${cgformConfig.cgFormHead.jformPkSequence}")  
</#if>
@SuppressWarnings("serial")
public class ${entityName}Entity implements java.io.Serializable {

	<#list columns as po>
	/**${po.content}*/
	<#if po.isShow != 'N'>
	<#--update-begin--Author:taoYan  Date:20170807 for：TASK #3021 【代码生成器 - 陶炎】popup配置影响了导出excel功能 -->
    <@excel po = po/>
	<#--update-end--Author:taoYan  Date:20170807 for：TASK #3021 【代码生成器 - 陶炎】popup配置影响了导出excel功能 -->
	</#if>
	<#--update-start--Author:luobaoli  Date:20150609 for：将数据库中blob类型对应为byte[]-->
	private <#if po.type=='java.sql.Blob'>byte[]<#else>${po.type}</#if> ${po.fieldName};
	<#--update-end--Author:luobaoli  Date:20150609 for：将数据库中blob类型对应为byte[]-->
	</#list>
	
	<#list columns as po>
	/**
	 *方法: 取得${po.type}
	 *@return: ${po.type}  ${po.content}
	 */
	<#if po.fieldName == jeecg_table_id>
	<#if cgformConfig.cgFormHead.jformPkType?if_exists?html == "UUID">
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	<#elseif cgformConfig.cgFormHead.jformPkType?if_exists?html == "NATIVE">
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	<#elseif cgformConfig.cgFormHead.jformPkType?if_exists?html == "SEQUENCE">
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="SEQ_GEN")  
	<#else>
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	</#if>
	</#if>
	<#--update-start--Author:luobaoli  Date:20150609 for：将数据库中blob类型对应为byte[]，且去掉length属性-->

	@Column(name ="${fieldMeta[po.fieldName]}",nullable=<#if po.isNull == 'Y'>true<#else>false</#if><#if po.pointLength != 0>,scale=${po.pointLength}</#if><#if po.type!='java.sql.Blob'><#if po.length !=0>,length=${po.length?c}</#if></#if>)
	public <#if po.type=='java.sql.Blob'>byte[]<#else>${po.type}</#if> get${po.fieldName?cap_first}(){
		return this.${po.fieldName};
	}

	/**
	 *方法: 设置${po.type}
	 *@param: ${po.type}  ${po.content}
	 */
	public void set${po.fieldName?cap_first}(<#if po.type=='java.sql.Blob'>byte[]<#else>${po.type}</#if> ${po.fieldName}){
		this.${po.fieldName} = ${po.fieldName};
	}
	<#--update-end--Author:luobaoli  Date:20150609 for：将数据库中blob类型对应为byte[]，且去掉length属性-->
	</#list>
	
	
    private List<${entityName}Entity> ${entityName?uncap_first}List ;
	
    @Transient
	public List<${entityName}Entity> get${entityName}List() {
		return ${entityName?uncap_first}List;
	}

	public void set${entityName}List(List<${entityName}Entity> ${entityName?uncap_first}List) {
		this.${entityName?uncap_first}List = ${entityName?uncap_first}List;
	}
}
