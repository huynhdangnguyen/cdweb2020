package com.cdweb.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdweb.entity.HistoryEntity;
import com.cdweb.repository.intf.StatisticRepository;
import com.cdweb.service.intf.StatisticService;

@Service
public class StatisticServiceImpl implements StatisticService {

	@Autowired
	StatisticRepository statisticRepository;
	
	public static List<String> days;
	public static List<Integer> incomes;
	public static String startDate;
	public static String endDate;
	public static String startDate2;
	public static String endDate2;

	@Override
	public void getIncome(String startDate, String endDate) {
		days = new ArrayList<String>();
		incomes = new ArrayList<Integer>();
		SimpleDateFormat formater;
		try {
			formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date startDay = formater.parse(startDate);
			Date endDay = formater.parse(endDate);

			Calendar start = Calendar.getInstance();
			start.setTime(startDay);

			Calendar end = Calendar.getInstance();
			end.setTime(endDay);

			List<HistoryEntity> listHistoryEntity = statisticRepository.findAllByOutDateBetween(startDay, endDay);

			listHistoryEntity.forEach(
					(his) -> System.out.println(his.getPlateNo() + "\t" + his.getOutDate() + "\t" + his.getPrice()));

			for (Date date = start.getTime(); start.before(end); start.add(Calendar.DATE, 1), date = start.getTime()) {
				int totalInComeInADay = 0;
				for (HistoryEntity historyEntity : listHistoryEntity) {
					if (date.getDate() == historyEntity.getOutDate().getDate()) {
						try {
							totalInComeInADay += historyEntity.getPrice();
						} catch (Exception e) {
							// TODO: handle exception
						}
					}
				}
				formater = new SimpleDateFormat("dd-MM");
				days.add("'"+formater.format(date)+"'");
				for (String days : days) {
				}
				incomes.add(totalInComeInADay);
			}
			formater = new SimpleDateFormat("dd-MM-yyyy");
			StatisticServiceImpl.startDate = formater.format(startDay);
			StatisticServiceImpl.endDate = formater.format(endDay);
			formater = new SimpleDateFormat("yyyy-MM-dd");
			StatisticServiceImpl.startDate2 = formater.format(startDay);
			StatisticServiceImpl.endDate2 = formater.format(endDay);

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}


}
