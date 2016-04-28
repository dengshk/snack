    <div class="portlet box blue" style="width:35%;margin-left:35%;margin-top:150px;">
	<div class="portlet-title">
		<div class="caption">
			<#if (customerInfo.id)??>编辑顾客信息</#if><#if !(customerInfo.id)??>添加顾客信息</#if>
		</div>
		<div class="tools">
			<button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
		</div>
	</div>
	<div class="portlet-body form">
		<form class="form-horizontal form-bordered form-row-seperated" id="editUser" method="post">
			<input name="id" type="hidden" id="id" value="${(customerInfo.id)!}"/>
			<div class="form-body">
				<!--顾客名称-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="customerName" class="">
						<span style="color:red;">*&nbsp;</span>
						顾客名称
					</label>
					<div class="input-icon right col-md-7">
						<input name="customerName" type="text" class="form-control" id="customerName" value="${(customerInfo.customerName)!}" maxlength="20" placeholder="请输入顾客名称">
						<span class="help-block" for="customerName"></span>
					</div>
				</div>
				<!--联系电话-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="customerTel" class="">
						<span style="color:red;">*&nbsp;</span>
						联系电话
					</label>
					<div class="input-icon right col-md-7">
						<input name="customerTel" type="text" class="form-control " id="customerTel" value="${(customerInfo.customerTel)!}" maxlength="20" placeholder="请输入联系电话">
						<span class="help-block" for="customerTel"></span>
					</div>
				</div>
				<!--收货地址-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="address" class="">
						<span style="color:red;">*&nbsp;</span>
						收货地址
					</label>
					<div class="input-icon right col-md-7">
						<input name="address" type="text" class="form-control " id="address" value="${(customerInfo.address)!}" maxlength="20" placeholder="请输入收货地址">
						<span class="help-block" for="address"></span>
					</div>
				</div>
			</div>
			<div class="form-actions modal-footer">
				<button type="button" class="btn blue save">确定</button>
				<button type="button" class="btn default" data-dismiss="modal">取消</button>
			</div>
		</form>
	</div>	
</div>
<!--开关按钮的JS(是否启用)-->
<script src="${application.getContextPath()}/scripts/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>