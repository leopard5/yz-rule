package com.yz.rule.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yz.rule.dao.model.Event;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomMapper extends BaseMapper<Event> {
    IPage<Event> pageList(Page<Event> page);
}
