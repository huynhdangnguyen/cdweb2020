<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thống kê</title>

</head>
<body>
	<div id="main-body">
		<div class="form-row">
			<div class="col-md-8">
				<div class="position-relative form-group">
					<form class="form-inline" name="datePicker">
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<label class="mr-sm-2">Từ ngày</label> <input type="date"
								id="startDate" name="startDate" class="form-control">
						</div>
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<label class="mr-sm-2">Đến ngày</label> <input type="date"
								id="endDate" name="endDate" class="form-control">
						</div>
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<button type="button" class="btn btn-primary"
								onclick="doStatistic()">Thống kê</button>
						</div>
					</form>
				</div>
			</div>

			<div class="col-md-4"></div>
		</div>
		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Thống kê doanh thu</h5>


				<div class="container">
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</div>
	</div>

	<script>
	document.datePicker.startDate.value = '${startDate2}';
	document.datePicker.endDate.value = '${endDate2}';
		let myChart = document.getElementById('myChart').getContext('2d');

		// Global Options
		Chart.defaults.global.defaultFontFamily = 'Arial';
		Chart.defaults.global.defaultFontSize = 14;
		Chart.defaults.global.defaultFontColor = '#595959';

		let massPopChart = new Chart(myChart, {
			type : 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
			data : {
				labels : ${listDays},
				datasets : [ {
					label : 'VND',
					data : ${listIncomes },
					//backgroundColor:'green',
					backgroundColor : 'rgb(3, 112, 95)',
					borderWidth : 1,
					borderColor : '#777',
					hoverBorderWidth : 3,
					hoverBorderColor : '#7db5ac'
				} ]
			},
			options : {
				scales: {
		            yAxes: [{
		                ticks: {
		                    suggestedMin: 0
		                }
		            }]
		        },
				title : {
					display : true,
					text : 'Doanh thu từ ' +'${startDate}'+ ' đến '+ '${endDate}',
					fontSize : 20
				},
				legend : {
					display : true,
					position : 'right',
					labels : {
						fontColor : '#000'
					}
				},
				layout : {
					padding : {
						left : 50,
						right : 0,
						bottom : 0,
						top : 0
					}
				},
				tooltips : {
					enabled : true
				}
				
			}
		});
	</script>

	<script type="text/javascript">
	function doStatistic() {
		var startDate = ""+document.datePicker.startDate.value;
		if (startDate==="") {
			startDate =""+ '${SystemConstant.CURRENT_YEAR_MONTH_1ST_url}';
		} else {
			startDate +="%2000:00:00";
		}
		var endDate=""+document.datePicker.endDate.value;
		if (endDate==="") {
			endDate =""+ '${SystemConstant.CURRENT_YEAR_MONTH_DAY_url}';
		} else {
			endDate +="%2023:59:59";
		}
		
		window.location.href =window.location.origin+"/parkinglotmanagement/quan-ly/thong-ke/"+startDate+"/"+endDate;
	}</script>
</body>
</html>