<%@ page language="java" pageEncoding="utf-8"%>
<form id="paperCfgEditForm" method="post">
	<input type="hidden" id="paperCfgEdit_id" name="id" value="${paperQuestion.id }" />
	<input type="hidden" id="paperCfgEdit_parentId" name="parentId" value="${paperQuestion.parentId }" />
	<input type="hidden" id="paperCfgEdit_paperId" name="paperId" value="${paperQuestion.paperId }" />
	<table class="kv-table">
		<tr>
			<td class="kv-label">名称：</td>
			<td colspan="3" class="kv-content">
				<input id="paperCfgEdit_name" name="name" value="${paperQuestion.name }" style="width: 180px;height: 30px;" />
			</td>
		</tr>
		<tr>
			<td class="kv-label">描述：</td>
			<td colspan="3" class="kv-content">
				<textarea id="paperCfgEdit_description" name="description">${paperQuestion.description }</textarea>
			</td>
		</tr>
	</table>
</form>