<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="yogogym" tagdir="/WEB-INF/tags" %>

<yogogym:layout pageName="diets">

	<spring:url value="/trainer/${trainerUsername}/clients/{clientId}" var="clientUrl">
		<spring:param name="clientId" value="${client.id}"/>
	</spring:url>
	<h2>Trainer: Diet Details of <a href="${fn:escapeXml(clientUrl)}"><c:out value="${client.firstName} ${client.lastName}"/></a></h2>
	<br>	
	<h3>Client params: </h3>
	<table class="table table-striped">
			<thead>
	        <tr>
				<th>Weight</th>
	        	<th>Height</th>
	            <th>Age</th>
	            <th>Fat percentage</th>
	        </tr>
	        </thead>
			<tr>
				<td><c:out value="${client.weight}"/></td>	
				<td><c:out value="${client.height}"/></td>	
				<td><c:out value="${client.age}"/></td>	
				<td><c:out value="${client.fatPercentage}"/></td>	
			</tr>	
		</table>

	<h3>Diet: </h3>
		<table class="table table-striped">
			<thead>
	        <tr>
				<th>Training</th>
	        	<th>Diet</th>
	            <th>Description</th>
	            <th>Type</th>
	            <th>Kcals</th>
	            <th>Proteins</th>
				<th>Carbs</th>
	            <th>Fats</th>
				<th>Edit</th>
	        </tr>
	        </thead>
			<tr>
				<td><c:out value="${training.name}"/></td>	
				 	<td><c:out value="${diet.name}"/></td>
		            <td><c:out value="${diet.description}"/></td>
		            <td><c:out value="${diet.type}"/></td>
		            <td><c:out value="${diet.kcal}"/></td>
		            <td><c:out value="${diet.protein}"/></td>
					<td><c:out value="${diet.carb}"/></td>
		            <td><c:out value="${diet.fat}"/></td>
					
					<c:choose>
						<c:when test="${training.endDate < actualDate}">	
							<td><a style="color:grey">Edit</a></td>		
						</c:when>
						<c:otherwise>
							<spring:url value="/trainer/${trainerUsername}/clients/${client.id}/trainings/{trainingId}/diets/{dietId}/edit" var="dietUpdateurl" >
							<spring:param name="trainingId" value="${training.id}"/>
							<spring:param name="dietId" value="${diet.id}"/>
							</spring:url>
							<td><a href="${fn:escapeXml(dietUpdateurl)}">Edit</a></td>
												
						</c:otherwise>
					</c:choose>
			</tr>	
		</table>

</yogogym:layout>
