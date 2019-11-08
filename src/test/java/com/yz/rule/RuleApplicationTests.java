package com.yz.rule;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yz.rule.dao.mapper.CustomMapper;
import com.yz.rule.dao.mapper.EventMapper;
import com.yz.rule.dao.model.Event;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RuleApplicationTests {

	@Resource
	private EventMapper eventMapper;
	@Resource
	private CustomMapper customMapper;


	@Test
	public void selectEvent() {
		Event event = eventMapper.selectById(174667);
		System.out.println(event.getBlNo());
	}

	@Test
	public void page() {
		List<Event> eventList = eventMapper.selectPage(new Page<>(1, 10), null).getRecords();
		eventList.forEach(System.out::println);
	}

	@Test
	public void pageList() {
		List<Event> eventList = customMapper.pageList(new Page<>(2, 5)).getRecords();
		eventList.forEach(System.out::println);
	}

}
