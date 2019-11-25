package com.yz.rule.configuration;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author yazhong
 */
@EnableTransactionManagement
@Configuration
@MapperScan("com.yz.rule.dao.mapper")
public class MybatisPlusConfig {

    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        // 你的最大单页限制数量，默认 500 条，小于 0 如 -1 不受限制
        paginationInterceptor.setLimit(500);
        return paginationInterceptor;
    }
}
