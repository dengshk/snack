    <div class="portlet box blue" style="width:35%;margin-left:35%;margin-top:150px;">
	<div class="portlet-title">
		<div class="caption">
			<#if (stockOrder.id)??>编辑订单</#if><#if !(stockOrder.id)??>添加订单</#if>
		</div>
		<div class="tools">
			<button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
		</div>
	</div>
	<div class="portlet-body form">
		<form class="form-horizontal form-bordered form-row-seperated" id="editUser" method="post">
			<input name="id" type="hidden" id="id_child" value="${(stockOrder.id)!}"/>
			<input name="productId" type="hidden" id="productId_child" value="${(stockOrder.productId)!}"/>
			<div class="form-body">
				<!--产品名称-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="productName" class="">
						<span style="color:red;">*&nbsp;</span>
						产品名称
					</label>
					<div class="input-icon right col-md-7">
						<input name="productName" type="text" class="form-control" id="productName_child" value="${(stockOrder.productName)!}" maxlength="20" placeholder="请输入产品名称">
						<span class="help-block" for="productName"></span>
					</div>
				</div>
				<!--进货单价-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="costPrice" class="">
						<span style="color:red;">*&nbsp;</span>
						进货单价
					</label>
					<div class="input-icon right col-md-7">
						<input name="costPrice" type="text" class="form-control" id="costPrice_child" value="${(stockOrder.costPrice)!}" maxlength="20" placeholder="请输入进货单价">
						<span class="help-block" for="costPrice"></span>
					</div>
				</div>
				<!--进货数量-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="orderNum" class="">
						<span style="color:red;">*&nbsp;</span>
						进货数量
					</label>
					<div class="input-icon right col-md-7">
						<input name="orderNum" type="text" class="form-control" id="orderNum_child" value="${(stockOrder.orderNum)!}" maxlength="20" placeholder="请输入进货数量">
						<span class="help-block" for="orderNum"></span>
					</div>
				</div>
			<div class="form-actions modal-footer">
				<button type="button" class="btn blue saveOrder">确定</button>
				<button type="button" class="btn default" data-dismiss="modal">取消</button>
			</div>
		</form>
	</div>	
</div>
<!--开关按钮的JS(是否启用)-->
<script src="${application.getContextPath()}/scripts/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>