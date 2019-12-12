package com.yz.rule;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yz.rule.dao.mapper.CustomMapper;
import com.yz.rule.dao.mapper.EventMapper;
import com.yz.rule.dao.model.Event;
import io.rebloom.client.Client;
import io.rebloom.client.ClusterClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.geo.*;
import org.springframework.data.redis.connection.RedisGeoCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import org.testng.collections.Maps;
import redis.clients.jedis.HostAndPort;

import javax.annotation.Resource;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RuleApplicationTests {
    @Resource
    private EventMapper eventMapper;
    @Resource
    private CustomMapper customMapper;
    @Resource
    private RedisTemplate<String, String> template;


    private static String REDIS_GEO_PORT_KEY = "geo-test";

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


    @Test
    public void redisTest() {
        testAdd();
        testGeoGet();
        testDist();
        testNearByXY();
        testNearByPlace();
        testGeoHash();
    }


    @Test
    public void testAdd() {
        Map<String, Point> geoMap = Maps.newHashMap();
        geoMap.put("beijing", new Point(116.405285, 39.904989));
        geoMap.put("shanghai", new Point(121.473701, 31.230416));
        geoMap.put("shenzhen", new Point(114.057865, 22.543096));

        Long addedNum = template.opsForGeo()
                .add(REDIS_GEO_PORT_KEY, geoMap);
        System.out.println(addedNum);
    }

    @Test
    public void testGeoGet() {
        List<Point> points = template.opsForGeo().position(REDIS_GEO_PORT_KEY, "beijing", "shanghai", "shenzhen");
        System.out.println(points);
    }

    @Test
    public void testDist() {
        Distance distance = template.opsForGeo()
                .distance(REDIS_GEO_PORT_KEY, "beijing", "shanghai", RedisGeoCommands.DistanceUnit.KILOMETERS);
        System.out.println(distance);
    }

    @Test
    public void testNearByXY() {
        //longitude,latitude
        Circle circle = new Circle(116.405285, 39.904989, Metrics.KILOMETERS.getMultiplier());
        RedisGeoCommands.GeoRadiusCommandArgs args = RedisGeoCommands.GeoRadiusCommandArgs.newGeoRadiusArgs().includeDistance().includeCoordinates().sortAscending().limit(5);
        GeoResults<RedisGeoCommands.GeoLocation<String>> results = template.opsForGeo()
                .radius(REDIS_GEO_PORT_KEY, circle, args);
        System.out.println(results);
    }

    @Test
    public void testNearByPlace() {
        Distance distance = new Distance(5, Metrics.KILOMETERS);
        RedisGeoCommands.GeoRadiusCommandArgs args = RedisGeoCommands.GeoRadiusCommandArgs.newGeoRadiusArgs().includeDistance().includeCoordinates().sortAscending().limit(5);
        GeoResults<RedisGeoCommands.GeoLocation<String>> results = template.opsForGeo()
                .radius(REDIS_GEO_PORT_KEY, "beijing", distance, args);
        System.out.println(results);
    }

    @Test
    public void testGeoHash() {
        List<String> results = template.opsForGeo()
                .hash(REDIS_GEO_PORT_KEY, "beijing", "shanghai", "shenzhen");
        System.out.println(results);
    }

    @Test
    public void testHyperLogLog() {
        template.opsForHyperLogLog().add("HyperLogLog", "a", "b", "c");
        template.opsForHyperLogLog().add("HyperLogLog1", "a", "e", "f", "g", "e", "h");

        template.opsForHyperLogLog().size("HyperLogLog");
        template.opsForHyperLogLog().size("HyperLogLog1");
        template.opsForHyperLogLog().union("HyperLogLogUnion", "HyperLogLog1", "HyperLogLog1");

        template.opsForHyperLogLog().size("HyperLogLogUnion");

        System.out.println();
    }

    @Test
    public void testBloomFilter() {

    }


    public void multiSetBit(String name, boolean value, long... offsets) {
        template.executePipelined((RedisCallback) connection -> {
            for (long offset : offsets) {
                connection.setBit(name.getBytes(), offset, value);
            }
            return null;
        });
    }


    public List multiGetBit(String name, long... offsets) {
        List results = template.executePipelined((RedisCallback) connection -> {
            for (long offset : offsets) {
                connection.getBit(name.getBytes(), offset);
            }
            return null;
        });

        List<Boolean> list = new ArrayList<>();

        results.forEach(obj -> {
            list.add((Boolean) obj);
        });

        return list;
    }


    @Test
    public void jreBloomFilter() {
        Client client = new Client("localhost", 6378);


        client.add("simpleBloom", "Mark");
// Does "Mark" now exist?
        client.exists("simpleBloom", "Mark"); // true
        client.exists("simpleBloom", "Farnsworth"); // False


        client.addMulti("simpleBloom", "foo", "bar", "baz", "bat", "bag");

// Check if they exist:
        boolean[] rv = client.existsMulti("simpleBloom", "foo", "bar", "baz", "bat", "mark", "notexist");


        client.createFilter("specialBloom", 10000, 0.0001);
        client.add("specialBloom", "foo");
    }

    @Test
    public void redisClusterBloomFilter() {
        Set<HostAndPort> jedisClusterNodes = new HashSet<>();
        jedisClusterNodes.add(new HostAndPort("localhost", 7000));
        ClusterClient cclient = new ClusterClient(jedisClusterNodes);

        cclient.add("simpleBloom", "Mark");
// Does "Mark" now exist?
        cclient.exists("simpleBloom", "Mark"); // true
        cclient.exists("simpleBloom", "Farnsworth"); // False

    }
}
