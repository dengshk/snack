    <div class="portlet box blue" style="width:30%;margin-left:35%;margin-top:50px;">
	<div class="portlet-title">
		<div class="caption">
			<#if (product.id)??>编辑产品</#if><#if !(product.id)??>添加产品</#if>
		</div>
		<div class="tools">
			<button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
		</div>
	</div>
	<div class="portlet-body form">
		<form class="form-horizontal form-bordered form-row-seperated" id="editUser" method="post">
			<input name="id" type="hidden" id="id" value="${(product.id)!}"/>
			<div class="form-body">
				<!--产品名称-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="name" class="">
						<span style="color:red;">*&nbsp;</span>
						产品名称
					</label>
					<div class="input-icon right col-md-7">
						<input name="name" type="text" class="form-control" id="name" value="${(product.name)!}" <#if product.id??>readonly="readonly"</#if> maxlength="20" placeholder="请输入产品名称">
						<span class="help-block" for="name"></span>
					</div>
				</div>
				<!--产品分类-->
				<div class="input-icon right col-md-4">
					<label class="">产品分类</label>
					<select class="form-control select2me" name="typeId" id="typeId">
						<option value="-1" <#if product.typeId?? && '-1' == product.typeId>selected="true"</#if>>未分类</option>
						<#if productTypes ?? && productTypes?size &gt; 0>
							<#list productTypes as p>
								<option value="${(p.typeId)!}" <#if product.typeId?? && p.typeId?number == product.typeId?number>selected="true"</#if>>${(p.typeName)!}</option>
							</#list>
						</#if>
					</select>
				</div>
				<!--状态-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label class="col-md-4" style="text-align:center;margin-top:15px;">状态</label>
					<div class="col-md-7">
						<div class="make-switch" data-on="success" data-off="danger" data-on-label="在售" data-off-label="下架">
							<input id="islock" type="checkbox" <#if !((product.state)??) || product.state == 0>checked</#if> class="toggle"/>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions modal-footer">
				<button type="button" class="btn blue saveUser">确定</button>
				<button type="button" class="btn default" data-dismiss="modal">取消</button>
			</div>
		</form>
	</div>	
</div>
<!--开关按钮的JS(是否启用)-->
<script src="${application.getContextPath()}/scripts/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>