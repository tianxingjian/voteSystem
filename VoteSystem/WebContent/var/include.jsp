<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<fmt:setLocale value="${header['accept-language']}"/>
<fmt:setBundle basename="i18n/messages"/>
<script type="text/javascript">
  //for global use
  var contextRootPath = "${ctx}";
</script>