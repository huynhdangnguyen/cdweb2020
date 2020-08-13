<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form:form modelAttribute="customerModel" id="customerForm">
	<label>id:</label>
	<form:input path="id" placeholder="Chứng minh nhân dân" name="id" />
	<small><form:errors path="id" /></small>
	<button type="button" onclick="createCustomer()">Thêm khách hàng</button>
</form:form>